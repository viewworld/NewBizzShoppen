class CampaignsResultField < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :result_field

  validate :euro_value_present_if_is_dynamic_value

  private

  def euro_value_present_if_is_dynamic_value
    if is_dynamic_value? and dynamic_euro_value.blank?
      errors.add(:dynamic_euro_value, :blank)
    end
  end
end
