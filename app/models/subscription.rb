class Subscription < ActiveRecord::Base
  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy

  belongs_to :user
  belongs_to :subscription_plan

  before_save :apply_time_constraints

  acts_as_list :scope => :user_id

  scope :active, where("is_active = ? and end_date >= ?", true, Date.today)

  def self.clone_from_subscription_plan!(subscription_plan, user)
    subscription = Subscription.new(:user => user)
    subscription_plan.attributes.keys.except(["id", "roles_mask", "created_at", "updated_at"]).each do |method|
      subscription.send("#{method}=".to_sym, subscription_plan.send(method.to_sym))
    end
    subscription.subscription_plan = subscription_plan
    subscription_plan.subscription_plan_lines.each do |line|
      subscription.subscription_plan_lines << line.clone
    end
    subscription.save
    subscription
  end

  def apply_time_constraints
    if start_date.blank? and end_date.blank?
      self.start_date = Date.today
      self.end_date = Date.today + billing_cycle.weeks
    end
  end
end
