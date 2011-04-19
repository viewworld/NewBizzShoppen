class ::User::CallCentreAgent < ::User
  ROLES = [:call_centre_agent]

  include User::CommonAgent
  include Addresses
  include BankAccounts

  before_validation :skip_address_validation

  # TODO wtf?
  def can_publish_leads?
    true
  end

  def leads
    Lead.with_created_by(self.id)
  end

  def comment_threads
    Comment.roots.for_leads(leads)
  end

  private

  def skip_address_validation
    if address
      address.disabled_validations = true
    end
  end
end