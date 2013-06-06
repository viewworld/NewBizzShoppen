class Survey < ActiveRecord::Base
  include ScopedSearch::Model

  has_many :survey_questions, :order => "position", :dependent => :destroy
  has_many :survey_recipients, :dependent => :destroy
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"

  accepts_nested_attributes_for :survey_questions, :allow_destroy => true

  validates_presence_of :title, :unless => Proc.new{|n| n.skip_validations}

  attr_accessor :skip_validations

  before_create :set_uuid

  private

  def set_uuid
    self.uuid = SecureRandom.hex(18)
  end
end
