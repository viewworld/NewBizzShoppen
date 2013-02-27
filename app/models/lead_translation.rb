class LeadTranslation < ActiveRecord::Base
  attr_accessor :skip_hidden_field_validation
  validates_presence_of :header, :description
  #validates_presence_of :hidden_description, :unless => Proc.new{|lt| lt.skip_hidden_field_validation=="true" }
end