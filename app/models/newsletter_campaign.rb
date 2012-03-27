class NewsletterCampaign < ActiveRecord::Base
  has_many :newsletter_lists


  after_create :set_name

  SAVED_AS_DRAFT = 0.freeze
  SENT_TO_CM = 1.freeze
  STATUSES = [SAVED_AS_DRAFT, SENT_TO_CM]

  include CommonNewsletter

  private

  def set_name
    self.name = "FDNL #{Date.today.to_s}"
  end
end
