class SubscriptionPlan < ActiveRecord::Base

  include ScopedSearch::Model
  include RoleModel

  ROLES = [:supplier, :lead_supplier, :lead_user, :member, :category_supplier, :deal_maker]

  roles ROLES

  validates_presence_of :name, :billing_cycle, :billing_period, :roles, :currency_id, :currency
  validates_numericality_of :billing_cycle, :billing_period
  validates_numericality_of :lockup_period, :free_period, :allow_nil => true

  has_many :subscription_plan_lines, :dependent => :destroy
  belongs_to :currency

  accepts_nested_attributes_for :subscription_plan_lines, :allow_destroy => true

  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q}%") }


  def roles_as_text
    roles.to_a.map { |r| r.to_s.humanize }.join(', ')
  end
end
