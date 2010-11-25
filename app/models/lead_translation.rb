class LeadTranslation < ActiveRecord::Base
  validates_presence_of :header, :description, :hidden_description
end