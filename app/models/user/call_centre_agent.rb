class ::User::CallCentreAgent < ::User
  ROLES = [:call_centre_agent]

  include User::CommonAgent
  include Addresses
  include BankAccounts

  before_validation :skip_address_validation


  def can_publish_leads?
    true
  end

  private

  def skip_address_validation
    if address
      address.disabled_validations = true
    end
  end
end