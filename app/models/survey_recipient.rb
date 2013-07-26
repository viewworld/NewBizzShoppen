class SurveyRecipient < ActiveRecord::Base
  include ScopedSearch::Model

  has_many :survey_answers, :dependent => :destroy
  belongs_to :survey
  belongs_to :recipient, :polymorphic => true, :foreign_key => "recipient_id"

  accepts_nested_attributes_for :survey_answers, :allow_destroy => true

  validates_presence_of :survey_id
  validates_uniqueness_of :survey_id, :scope => [:recipient_id, :recipient_type]

  before_create :set_uuid
  before_save :mark_empty_survey_answers_for_removal
  after_create :notify_recipient_by_email, :unless => Proc.new { |sr| sr.skip_notify_recipient }

  attr_accessor :from_newsletter, :skip_notify_recipient

  liquid :survey_link, :survey_name, :first_name, :last_name, :company_name

  scope :for_recipient, lambda { |recipient| where(:recipient_id => recipient.id, :recipient_type => recipient.is_a?(AbstractLead) ? "AbstractLead" : recipient.class.to_s) }
  scope :for_survey, lambda { |survey| where(:survey_id => survey.id) }
  scope :with_state, lambda { |state| where(:state => state) }

  STATE_NOT_VISITED = 0.freeze
  STATE_VISITED = 1.freeze
  STATE_COMPLETED = 2.freeze

  def survey_link
    "#{Rails.env.development? ? "http://erhvervsanalyse.dk:3000" : "http://#{'beta.' if Rails.env.staging?}erhvervsanalyse.dk"}/survey/#{uuid}"
  end

  def build_answer(question)
    survey_answers.detect { |sa| sa.survey_question_id == question.id } || self.survey_answers.build(:survey_question => question, :survey_recipient => self, :question_type => question.question_type)
  end

  def build_survey_answers_ordered
    ordered_answers = []
    survey.survey_questions.without_nested.each do |question|
      ordered_answers << build_answer(question)
      if question.is_branched?
        question.branched_questions.each do |branched_question|
          ordered_answers << build_answer(branched_question)
        end
      end
    end

    ordered_answers
  end

  def sent?
    email_sent_at.present?
  end

  def not_visited?
    state == STATE_NOT_VISITED
  end

  def visited?
    state == STATE_VISITED
  end

  def completed?
    state == STATE_COMPLETED
  end

  def visited!
    if not_visited?
      update_attribute(:state, STATE_VISITED)
      if survey.link_clicked_chain_mail_type.present? and !survey.use_chain_mail_as_intro_mail?
        ChainMail.create(:chain_mailable => self, :chain_mail_type => survey.link_clicked_chain_mail_type, :email => email)
      end
    end
  end

  def completed!
    unless completed?
      update_attribute(:state, STATE_COMPLETED)
      assign_option_tags!
      send_chain_mails_for_selected_options!
      if can_recipient_be_upgraded_to_leads?
        self.delay(:queue => "auto_upgrade_contacts_from_survey").upgrade_contact_to_leads!
      end
    end
  end

  def assign_option_tags!
    tags = survey_answers.select { |sa| sa.question_type == SurveyQuestion::SELECT_TYPE }.map do |survey_answer|
      survey_answer.survey_options.map(&:tag_list).flatten
    end.flatten.uniq

    tags.each { | tag| recipient.tag_list << tag }
    recipient.save
  end

  def send_chain_mails_for_selected_options!
    ChainMailType.joins(:survey_options => :survey_answers).select("distinct(chain_mail_types.*)").where("survey_answers.id IN (?)", survey_answer_ids).each do |chain_mail_type|
      ChainMail.create(:chain_mailable => self, :chain_mail_type => chain_mail_type, :email => email)
    end
  end

  def can_recipient_be_upgraded_to_leads?
    result = Result.where(:name => "Upgraded to lead", :generic => true).first
    recipient.is_a?(Contact) and !recipient.completed? and survey.upgrade_contacts_to_leads? and recipient.campaign.results.where(:id => result.id).first.present?
  end

  def categories_from_selected_options
    survey_answers.select { |sa| sa.question_type == SurveyQuestion::SELECT_TYPE }.map do |survey_answer|
      survey_answer.survey_options.map(&:category).flatten
    end.flatten.uniq
  end

  def categories
    (survey.categories + categories_from_selected_options).uniq
  end

  def upgrade_contact_to_leads!
    upgrade_to_lead_result = Result.where(:name => "Upgraded to lead", :generic => true).first

    if recipient.is_a?(Contact) and !recipient.completed? and survey.upgrade_contacts_to_leads? and recipient.call_results.detect { |cr| cr.result_id == upgrade_to_lead_result.id }.nil?
      campaign_result = upgrade_to_lead_result.campaigns_results.for_campaign(recipient.campaign).first
      recipient.attributes = { :currency_id => recipient.campaign.currency_id, :price => (campaign_result.settings["use_value_as_lead_price"] == "1" ? campaign_result.value.to_f : 0.0),
                               :purchase_decision_date => (Date.today+1.year).to_s, :sale_limit => 1, :header => survey.name, :published => true }
      recipient.save

      call_result = CallResult.new(:result_id => upgrade_to_lead_result.id, :survey_recipient => self)
      call_result.creator = survey.lead_creator.with_role
      call_result.contact = recipient
      call_result.save
    end
  end

  def email
    case
      when recipient.is_a?(AbstractLead) then recipient.email_address
      when recipient.is_a?(User) then recipient.email
      else
        ""
    end
  end

  def company_name
    recipient.company_name
  end

  def first_name
    recipient_name(:first_name)
  end

  def last_name
    recipient_name(:last_name)
  end

  def recipient_name(name_type)
    names = case
      when recipient.is_a?(AbstractLead) then recipient.contact_name.to_s.split(" ")
      when recipient.is_a?(User) then [recipient.first_name, recipient.last_name]
    end

    names[name_type == :first_name ? 0 : 1]
  end

  def survey_name
    survey.name
  end

  def notify_recipient_by_email
    return true if email.blank?

    if recipient.is_a?(Contact) and !from_newsletter
      template = recipient.campaign.survey_campaign_email_template
    else
      template = from_newsletter ? survey.survey_newsletter_email_template : :survey_campaign
    end

    if survey.use_chain_mail_as_intro_mail?
      ChainMail.create(:chain_mailable => self, :chain_mail_type => survey.link_clicked_chain_mail_type, :email => email)
    else
      TemplateMailer.new(email, template, Country.get_country_from_locale, {:survey_name => survey_name, :survey_link => survey_link, :company_name => company_name,
                                                                            :first_name => first_name, :last_name => last_name,
                                                                            :from => "admin@erhvervsanalyse.dk",
                                                                            :return_path => "admin@erhvervsanalyse.dk"}).deliver!
    end
    update_attribute(:email_sent_at, Time.now)
  end

  def next
    survey.survey_recipients.order("id").where("state = ?", STATE_COMPLETED).where("id > ?", id).first
  end

  def previous
    survey.survey_recipients.order("id DESC").where("state = ?", STATE_COMPLETED).where("id < ?", id).first
  end

  def answer_for_question(question)
    survey_answers.detect{ |sa| sa.survey_question_id == question.id }
  end

  private

  def mark_empty_survey_answers_for_removal
    survey_answers.each do |survey_answer|
      survey_answer.mark_for_destruction if (survey_answer.survey_question.parent_id.present? and !survey_answer.chosen_branched_question?) or (!survey_answer.is_required? and !survey_answer.is_filled?)
    end
  end

  def set_uuid
    self.uuid = SecureRandom.hex(18)
  end
end
