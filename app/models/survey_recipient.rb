class SurveyRecipient < ActiveRecord::Base

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

  liquid :survey_link, :survey_name

  scope :for_recipient, lambda { |recipient| where(:recipient_id => recipient.id, :recipient_type => recipient.is_a?(AbstractLead) ? "AbstractLead" : recipient.class.to_s) }

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
    update_attribute(:state, STATE_VISITED) if not_visited?
  end

  def completed!
    update_attribute(:state, STATE_COMPLETED) unless completed?
    assign_option_tags!
  end

  def assign_option_tags!
    tags = survey_answers.select { |sa| sa.question_type == SurveyQuestion::SELECT_TYPE }.map do |survey_answer|
      survey_answer.survey_options.map(&:tag_list).flatten
    end.flatten.uniq

    tags.each { | tag| recipient.tag_list << tag }
    recipient.save
  end

  def email
    case
      when recipient.is_a?(AbstractLead) then recipient.email_address
      when recipient.is_a?(User) then recipient.email
      else
        ""
    end
  end

  def survey_name
    survey.name
  end

  def notify_recipient_by_email
    return true if email.blank?

    if recipient.is_a?(Contact) and !from_newsletter
      template = recipient.campaign.survey_campaign_email_template
    else
      template = from_newsletter ? :survey_newsletter : :survey_campaign
    end

    TemplateMailer.new(email, template, Country.get_country_from_locale, {:survey_name => survey_name, :survey_link => survey_link,
                                                                          :from => "Erhvervsanalyse.dk <admin@erhvervsanalyse.dk>",
                                                                          :return_path => "admin@erhvervsanalyse.dk"}).deliver!
    update_attribute(:email_sent_at, Time.now)
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
