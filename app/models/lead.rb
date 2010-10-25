class Lead < ActiveRecord::Base
  translates :header, :description, :hidden_description

  include ScopedSearch::Model

  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category

  #TODO - Need to cache creator name, as SQL cannot look through polymorphics :P
  scope :with_keyword, lambda { |q| where("lower(header) like :keyword OR lower(description) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :deal_value_from, lambda { |q| where(["purchase_value >= ?",q]) }
  scope :deal_value_to, lambda { |q| where(["purchase_value <= ?",q]) }

  validates_presence_of :company_name, :lead_name, :phone_number

  def buyable?
    true #Some more complex logic here...
  end
end