class ::User::Admin < ::User
  ROLES = [:admin, :translator]

  include Addresses
  include BankAccounts

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
end