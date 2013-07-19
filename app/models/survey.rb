class Survey < ActiveRecord::Base
  include ScopedSearch::Model

  has_many :survey_questions, :order => "position", :dependent => :destroy
  has_many :survey_recipients, :dependent => :destroy
  has_many :survey_answers, :through => :survey_recipients
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :lead_creator, :foreign_key => "lead_creator_id", :class_name => "User"
  belongs_to :link_clicked_chain_mail_type, :class_name => "ChainMailType"
  belongs_to :link_not_clicked_chain_mail_type, :class_name => "ChainMailType"
  has_and_belongs_to_many :newsletter_lists
  has_and_belongs_to_many :campaigns
  has_and_belongs_to_many :categories
  has_one :survey_newsletter_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'survey_newsletter'", :dependent => :destroy

  accepts_nested_attributes_for :survey_questions, :allow_destroy => true

  validates_presence_of :name, :unless => Proc.new{|s| s.skip_validations}
  validates_numericality_of :link_not_clicked_chain_mail_delay, :if => Proc.new { |s| s.link_not_clicked_chain_mail_type.present? }
  validate :categories_and_lead_creator_present, :if => Proc.new{|n| n.upgrade_contacts_to_leads}

  attr_accessor :skip_validations

  before_create :set_uuid
  before_destroy :can_be_destroyed
  after_save :check_email_template

  scope :created_by, lambda { |creator| creator.has_any_role?(:category_supplier, :supplier) ? where("categories_surveys.category_id IN (?) OR creator_id = ?", creator.unique_category_ids, creator.id).joins(:categories) : where("creator_id = ?", creator.id) }

  def newsletter_owner
    User.where(:email => newsletter_owner_email).first
  end

  def set_sending_details!(sending_started_at)
    self.last_sent_at = Time.now
    self.last_sent_recipients_count = SurveyRecipient.where(:survey_id => id).where("email_sent_at > ?", sending_started_at).count
    self.save
  end

  def send_to_newsletter_lists!
    sending_started_at = Time.now
    newsletter_lists.each { |nl| send_by_email(nl) }
    set_sending_details!(sending_started_at)
  end

  def send_to_campaign!(contact_ids)
    Contact.where(:id => contact_ids).each { |contact| send_by_email(contact) }
  end

  def send_by_email(recipient)
    if recipient.is_a?(NewsletterList)
      recipient.newsletter_subscribers.each do |subscriber|
        create_survey_recipient(subscriber, true)
      end
    else
      create_survey_recipient(recipient)
    end
  end

  def create_survey_recipient(recipient, from_newsletter=false, notify_recipient=true)
    survey_recipients.create(:recipient => recipient.is_a?(NewsletterSubscriber) ? recipient.subscriber : recipient,
                             :from_newsletter => from_newsletter, :skip_notify_recipient => !notify_recipient)
  end

  def create_or_fetch_survey_recipient(recipient, notify_recipient=true)
    if (survey_recipient = create_survey_recipient(recipient, false, notify_recipient)) and survey_recipient.persisted?
      survey_recipient
    else
      survey_recipients.for_recipient(recipient).first
    end
  end

  def total_subscribers
    newsletter_lists.map { |nl| nl.newsletter_subscribers.count }.sum
  end

  def total_answers
    survey_recipients.where(:state => SurveyRecipient::STATE_COMPLETED).count
  end

  def can_be_managed_by?(user)
    user.admin? or (creator == user) or (user.has_any_role?(:category_supplier, :supplier) and (category_ids & user.unique_category_ids).present?)
  end

  def fake_permalink
    "http://erhvervsanalyse.dk/s/#{uuid}"
  end

  private

  def can_be_destroyed
    newsletter_lists.empty? and campaigns.empty? and survey_answers.empty?
  end

  def categories_and_lead_creator_present
    errors.add(:upgrade_contacts_to_leads, I18n.t("models.survey.upgrade_contacts_to_leads.categories_empty")) if categories.empty?
    errors.add(:lead_creator_id, I18n.t("models.survey.lead_creator.blank")) unless lead_creator
  end

  def set_uuid
    self.uuid = SecureRandom.hex(6)
  end

  def check_email_template
    unless survey_newsletter_email_template
      global_template = EmailTemplate.global.where(:uniq_id => "survey_newsletter").first
      self.survey_newsletter_email_template = global_template.clone
      global_template.translations.each do |translation|
        self.survey_newsletter_email_template.translations << translation.clone
      end
      self.save
    end
  end
end
