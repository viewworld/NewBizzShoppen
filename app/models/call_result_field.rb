class CallResultField < ActiveRecord::Base
  belongs_to :call_result
  belongs_to :campaigns_result_field

  validates_uniqueness_of :campaigns_result_field_id, :scope => :call_result_id
end