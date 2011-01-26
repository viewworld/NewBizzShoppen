class LeadTemplate < ActiveRecord::Base
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category
  has_many :lead_template_fields, :dependent => :destroy

  validates_presence_of :name

  accepts_nested_attributes_for :lead_template_fields, :allow_destroy => true
end
