class Survey < ActiveRecord::Base
  include ScopedSearch::Model

  has_many :survey_questions, :order => "position", :dependent => :destroy
  has_many :survey_recipients, :dependent => :destroy
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  has_and_belongs_to_many :newsletter_lists
  has_and_belongs_to_many :campaigns

  accepts_nested_attributes_for :survey_questions, :allow_destroy => true

  validates_presence_of :name, :unless => Proc.new{|n| n.skip_validations}

  attr_accessor :skip_validations

  before_create :set_uuid

  def newsletter_owner
    User.where(:email => newsletter_owner_email).first
  end

  def send_to_newsletter_lists!
     newsletter_lists.each { |nl| send_by_email(nl) }
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

  private

  def set_uuid
    self.uuid = SecureRandom.hex(18)
  end
end
