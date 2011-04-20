class User::Agent < ::User
  ROLES = [:agent]

  include User::RegistrationValidations
  include User::CommonAgent
  include Addresses
  include BankAccounts

  has_and_belongs_to_many :campaigns, :join_table => "campaigns_users", :foreign_key => "user_id"
  has_many :contacts, :foreign_key => :agent_id, :order => "leads.position ASC"  

  before_create :set_default_certification_level

  def comment_threads
    Comment.where(:commentable_id => leads.map(&:id))
  end

  private

  def set_default_certification_level
    self.certification_level = User::BRONZE_CERTIFICATION
  end

  def has_max_contacts_in_campaign?(campaign)
    contacts.for_campaign(campaign).with_pending_status(false).count >= campaign.max_contact_number
  end
end