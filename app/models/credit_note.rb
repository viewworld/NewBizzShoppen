class CreditNote < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :currency
  belongs_to :user

  NOTE_TYPES = ["credit".freeze, "refund".freeze]

  include ScopedSearch::Model

  scope :with_keyword, lambda { |keyword| where("users.first_name like :q or users.last_name like :q or credit_notes.number::TEXT like :q", { :q => "%#{keyword}%" }).joins(:invoice => [:user]) }
  scope :with_type, lambda { |type_name| where("lower(type) = ?", type_name) }

  public

  def invoice_lines
    invoice.invoice_lines.where("is_credited = ?", true)
  end

  def supplier
    invoice ? invoice.user : nil
  end

  def full_number
    number ? "#{number}/#{created_at.year}" : ""
  end
end