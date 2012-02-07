class ResultField < ActiveRecord::Base

  STRING = 0.freeze
  INTEGER = 1.freeze
  DATE = 2.freeze
  NOTE = 3.freeze
  DATETIME = 4.freeze
  MATERIAL = 5.freeze
  FIELD_TYPES = [STRING, INTEGER, DATE, NOTE, DATETIME, MATERIAL]

  belongs_to :result
  has_many :result_value
  has_many :campaigns_result_fields, :foreign_key => "result_field_id", :dependent => :destroy

  accepts_nested_attributes_for :campaigns_result_fields, :allow_destroy => true

  validates_presence_of :name, :field_type

  def value_for_call_result(call_result)
    rv = result_value_for_call_result(call_result)
    rv.nil? ? "" : rv.value
  end

  def result_value_for_call_result(call_result)
    ResultValue.first(:conditions => ["call_result_id = ? and result_field_id = ?", call_result.id, id])
  end

  def campaigns_result_field_for(campaign)
    campaigns_result_fields.detect { |crf| crf.campaign == campaign } || campaigns_result_fields.new(:campaign => campaign)
  end
end
