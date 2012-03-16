class NewsletterSubscriber < ActiveRecord::Base
  has_and_belongs_to_many :newsletter_sources
  has_many :newsletter_lists, :through => :newsletter_sources
  belongs_to :subscribable, :polymorphic => true

  before_save :set_previous_email

  private

  def set_previous_email
    if new_record?
      self.previous_email = email
    elsif  is_synced? and email_changed?
      self.previous_email = email_was
      self.is_synced = false
    end
    true
  end

  public

  def assign_to_subscribable_sources!
      subscribable.reload
      subscribable.all_newsletter_sources.each do |source|
        source.newsletter_subscribers << self unless source.newsletter_subscribers.include?(self)
      end
  end

  #sync subscribers with the same prev_email_address if email_address was changed
end
