module User::CommonCaller
  def self.included(base)
    base.class_eval do
      has_many :contacts, :foreign_key => :agent_id, :order => "leads.position ASC"
      has_and_belongs_to_many :campaigns, :join_table => "campaigns_users", :foreign_key => "user_id"
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    def has_max_contacts_in_campaign?(campaign)
      max_contacts = campaign.private_contact_pool? ? campaign.max_contact_number.to_i : 1
      contacts.for_campaign(campaign).with_pending_status(false).with_completed_status(false).count >= max_contacts
    end

  end
end