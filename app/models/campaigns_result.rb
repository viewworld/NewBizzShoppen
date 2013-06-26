class CampaignsResult < ActiveRecord::Base

  serialize :settings, Hash

  attr_accessor :temp_tag_list

  belongs_to :campaign
  belongs_to :result
  belongs_to :chain_mail_type

  before_save :set_euro_value

  scope :for_campaign, lambda { |campaign| where(:campaign_id => campaign.id) }

  acts_as_taggable

  CSV_ATTRS = %w{ campaign_name result_name }

  after_initialize do
    self.settings ||= {}
    if result
      result.settings.each do |key, options|
        self.settings[key] = options["value"] unless settings[key]
      end
    end
  end

  def set_euro_value
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