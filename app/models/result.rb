class Result < ActiveRecord::Base

  PENDING_RESULTS = [:call_back, :not_interested_now]

  has_many :call_results
  has_many :contacts, :through => :call_results
  has_and_belongs_to_many :campaigns, :join_table => "campaigns_results", :foreign_key => "result_id"
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"

  has_many :result_fields, :dependent => :destroy
  accepts_nested_attributes_for :result_fields, :allow_destroy => true

  scope :call_log_results, where(:final => false)
  scope :final_results, where(:final => true)
  scope :generic_results, where(:generic => true)
  scope :custom_results, where(:generic => false)

  validates :name, :presence => true

  def to_s
    name
  end

  def label
    name.gsub(" ","_").downcase.to_sym
  end

  def can_be_managed_by?(user)
    !generic? and (creator.id == user.id or user.has_role?(:admin))
  end

  def list_of_fields
    result_fields.map(&:name).join(", ")
  end

  def send_material?
    result_fields.map(&:field_type).include?(ResultField::MATERIAL.to_s)
  end


end