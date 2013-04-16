class CampaignsResult < ActiveRecord::Base
  attr_accessor :temp_tag_list

  belongs_to :campaign
  belongs_to :result
  belongs_to :chain_mail_type

  before_save :set_euro_value

  acts_as_taggable

  CSV_ATTRS = %w{ campaign_name result_name }

  def set_euro_value
    self.tag_list = tag_list
    if value.to_i > 0 and value_changed?
      self.euro_value = campaign.currency.to_euro(value)
    end
  end

  def temp_tag_list=(value)
    self.tag_list = value.uniq.compact
  end

  def to_s
    "#{campaign_name} - #{result_name}"
  end

  def campaign_name
    campaign ? campaign.name : "[campaign not assigned]"
  end

  def result_name
    result ? result.name : "[result not assigned]"
  end
end