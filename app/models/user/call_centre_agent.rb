class ::User::CallCentreAgent < ::User
  ROLES = [:call_centre_agent]

  include User::CommonAgent
  include Addresses
  include BankAccounts

  has_and_belongs_to_many :campaigns, :join_table => "campaigns_users", :foreign_key => "user_id"
  has_many :contacts, :foreign_key => :agent_id, :order => "leads.position ASC"  

  before_validation :skip_address_validation

  # TODO wtf?
  def can_publish_leads?
    true
  end

  def has_max_contacts_in_campaign?(campaign)
    contacts.for_campaign(campaign).count >= campaign.max_contact_number
  end

  private

  def skip_address_validation
    if address
      address.disabled_validations = true
    end
  end
end