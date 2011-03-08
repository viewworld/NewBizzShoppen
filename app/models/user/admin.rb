class ::User::Admin < ::User
  ROLES = [:admin]

  include Addresses
  include BankAccounts

  def can_publish_leads?
    true
  end

  def accessible_categories
    Category.all
  end
end