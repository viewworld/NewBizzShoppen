class Survey < ActiveRecord::Base
  include ScopedSearch::Model

  has_many :survey_questions, :order => "position", :dependent => :destroy
  has_many :survey_recipients, :dependent => :destroy
  has_many :survey_answers, :through => :survey_recipients
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  has_and_belongs_to_many :newsletter_lists
  has_and_belongs_to_many :campaigns
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :survey_questions, :allow_destroy => true

  validates_presence_of :name, :unless => Proc.new{|n| n.skip_validations}

  attr_accessor :skip_validations

  before_destroy :can_be_destroyed

  scope :created_by, lambda { |creator| where("creator_id = ?", creator.id) }

  def newsletter_owner
    User.where(:email => newsletter_owner_email).first
  end

  def send_to_newsletter_lists!
     newsletter_lists.each { |nl| send_by_email(nl) }
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

  private

  def can_be_destroyed
    newsletter_lists.empty? and campaigns.empty? and survey_answers.empty?
  end
end
