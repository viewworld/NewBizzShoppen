class ArchivedPaymentResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription, :polymorphic => true

  serialize :response_details

  include ScopedSearch::Model

  scope :with_keyword, lambda { |q| where("lower(response_details) like ?", "%#{q.downcase}%") }
  scope :with_subscription_type, lambda{|q| where(:subscription_type => q) }
  scope :with_subscription_id, lambda{|q| where(:subscription_id => q) }
  scope :with_user_id, lambda{|q| where(:user_id => q) }
  scope :with_response_type, lambda{|q| where(:response_type => q) }
  scope :with_has_errors, lambda{|q| where(:has_errors => q) }
  scope :with_txn_id, lambda { |q| where("lower(response_details) like ?", "%#{q.split('-').last}%") }
end