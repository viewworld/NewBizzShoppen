class Debtor < ActiveRecord::Base
  self.table_name =  "debtors"
  include ScopedSearch::Model
  belongs_to :owner, :class_name => "User"
  belongs_to :currency

  scope :with_not_invoiced, select("owner_id, currency_id,count(*) as not_invoiced_count, sum(price*quantity) as not_invoiced_sum, sum(euro_price*quantity) as not_invoiced_euro_sum").group("owner_id, currency_id")
  scope :with_keyword, lambda { |keyword| where("owner_id in (select owner_id from debtors where lower(header) like :keyword) OR lower(contact_name) like :keyword OR lower(company_name) like :keyword OR lower(owner_email) LIKE :keyword", :keyword => "%#{keyword.to_s.downcase}%") }
  scope :with_assigned_at_date_after_and_including, lambda { |date| where("owner_id in (select owner_id from debtors where assigned_at::DATE >= ?)",date.to_postgresql_date)}
  scope :with_assigned_at_date_before_and_including, lambda { |date| where("owner_id in (select owner_id from debtors where assigned_at::DATE <= ?)",date.to_postgresql_date)}
  scope :with_role, lambda { |role| where("owner_id in (select owner_id from debtors INNER JOIN users ON owner_id=users.id where users.roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0)") }
  scope :with_subscriber_type, lambda { |subscriber_type| where("owner_id in (select owner_id from debtors INNER JOIN users ON owner_id=users.id where users.subscriber_type like ?)", subscriber_type) }
  scope :with_owner, lambda { |owner| where(:owner_id => owner.to_i)}
end

