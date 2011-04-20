class AddLeadTypeToExistingLeads < ActiveRecord::Migration
  def self.up
    execute "UPDATE leads SET type = 'Lead'"
  end

  def self.down
  end
end
