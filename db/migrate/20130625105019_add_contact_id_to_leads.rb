class AddContactIdToLeads < ActiveRecord::Migration
  def self.up
    #now the contact can be upgraded to multiple leads
    add_column :leads, :contact_id, :integer

    Contact.where("lead_id is not null").each do |contact|
      if (lead = Lead.find_by_id(contact.lead_id))
        Lead.update_all( { :contact_id => contact.id }, { :id => lead.id } )
      end
    end
  end

  def self.down
    remove_column :leads, :contact_id
  end
end
