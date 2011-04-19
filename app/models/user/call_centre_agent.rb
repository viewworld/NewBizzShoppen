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
    Lead.with_created_by(id)
  end

  def comment_threads
    Comment.roots.where(:commentable_id => leads.map(&:id))
  end

  private

  def skip_address_validation
    if address
      address.disabled_validations = true
    end
  end
end