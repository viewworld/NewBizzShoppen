class CampaignsResultField < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :result_field

  validate :euro_value_present_if_is_dynamic_value
  before_save :disable_dynamic_value_if_not_number
  validates_uniqueness_of :result_field_id, :scope => :campaign_id
  private

  def disable_dynamic_value_if_not_number
    if is_dynamic_value? and result_field.field_type.to_i != ResultField::INTEGER
      self.is_dynamic_value = false
    end
    true
  end

  def euro_value_present_if_is_dynamic_value
    if is_dynamic_value? and dynamic_euro_value.blank?
      errors.add(:dynamic_euro_value, :blank)
    end
  end
end
