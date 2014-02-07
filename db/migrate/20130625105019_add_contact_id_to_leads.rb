class AddContactIdToLeads < ActiveRecord::Migration
  def self.up
    #now the contact can be upgraded to multiple leads
    add_column :leads, :contact_id, :integer
  end

  def self.down
    remove_column :leads, :contact_id
  end
end
