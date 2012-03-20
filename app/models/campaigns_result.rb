class CampaignsResult < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :result
  belongs_to :chain_mail_type

  before_save :set_euro_value

  def set_euro_value
    if value.to_i > 0 and value_changed?
      self.euro_value = campaign.currency.to_euro(value)
    end
  end
end