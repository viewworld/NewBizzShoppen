class SubscriptionPlan < ActiveRecord::Base

  include ScopedSearch::Model
  include RoleModel

  ROLES = [:supplier, :lead_supplier, :lead_user, :member, :category_supplier, :deal_maker]

  roles ROLES

  validates_presence_of :name, :billing_cycle, :billing_period, :roles, :currency_id, :currency
  validates_numericality_of :billing_cycle, :billing_period
  validates_numericality_of :lockup_period, :free_period, :allow_nil => true

  has_many :subscription_plan_lines, :dependent => :destroy
  has_one :invoice_email, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'invoice'", :dependent => :destroy
  belongs_to :currency

  after_save :check_email_templates

  accepts_nested_attributes_for :subscription_plan_lines, :allow_destroy => true

  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q}%") }

  private

  def check_email_templates
    unless invoice_email
      global_template = EmailTemplate.global.where(:uniq_id => 'invoice').first
      self.invoice_email = global_template.clone
      global_template.translations.each do |translation|
        self.invoice_email.translations << translation.clone
      end
      self.save
    end
  end

  public

  def roles_as_text
    roles.to_a.map { |r| r.to_s.humanize }.join(', ')
  end

  def total_billing
    subscription_plan_lines.inject(0.0){ |result, line| line.price.to_f + result}
  end
end
