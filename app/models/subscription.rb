class Subscription < ActiveRecord::Base

  include CommonSubscriptions

  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy
  belongs_to :user
  belongs_to :subscription_plan

  before_create :apply_time_constraints

  acts_as_list :scope => :user_id

  scope :active, where("is_active = ? and ((end_date IS NULL and billing_cycle = 0) or end_date >= ?)", true, Date.today)

  private

  def apply_time_constraints
    if start_date.blank? and end_date.blank?
      self.start_date = Date.today
      if billing_cycle > 0
        self.end_date = Date.today + billing_cycle.weeks + free_period.to_i.weeks
        self.billing_date = end_date + billing_period.weeks
      end
    end
  end

  public

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

  def cancel!
    self.is_active = false
    self.cancelled_at = Time.now
    self.save
  end

  def invoiced?
    !invoiced_at.blank?
  end
end
