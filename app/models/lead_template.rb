class LeadTemplate < ActiveRecord::Base
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  has_many :lead_template_fields

  validates_presence_of :category
end
