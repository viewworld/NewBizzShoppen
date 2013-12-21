class ::User::Admin < ::User
  ROLES = [:admin, :translator]
  CSV_ATTRS = %w{email first_name last_name company_name address_line_1 address_line_2 address_line_3 zip_code country region phone vat_number pnumber nnmid custom_1 custom_2 custom_3 custom_4 custom_5}

  validates_presence_of :company_name

  include Addresses
  include BankAccounts
  include CampaignMonitorClient

  def can_publish_leads?
    true
  end

  def accessible_categories
    Category.all
  end

  def comment_threads
    Comment.where("")
  end

  def leads
    Lead.where("")
  end

  def all_contacts_with_results
    Contact.with_results
  end

  def newsletter_manager?
    true
  end
end
