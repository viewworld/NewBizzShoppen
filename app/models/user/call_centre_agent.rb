class ::User::CallCentreAgent < ::User
  ROLES = [:call_centre_agent]

  include User::CommonAgent
  include Addresses
  include BankAccounts

  has_and_belongs_to_many :campaigns, :join_table => "campaigns_users", :foreign_key => "user_id"
  has_many :contacts, :foreign_key => :agent_id, :order => "leads.position ASC"
  has_many :deals, :as => :creator

  # TODO wtf?
  def can_publish_leads?
    true
  end

  def comment_threads
    Comment.with_leads_created_by(self)
  end
  
  def has_max_contacts_in_campaign?(campaign)
    contacts.for_campaign(campaign).with_pending_status(false).count >= campaign.max_contact_number rescue false
  end
end