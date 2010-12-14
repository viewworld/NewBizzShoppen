class LeadTranslation < ActiveRecord::Base
  validates_presence_of :header, :description
#  validates_presence_of :hidden_description, :unless => Proc.new{|lt| lt.lead.created_by?('PurchaseManager')}
end