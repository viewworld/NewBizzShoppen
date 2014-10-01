class AddSoftphoneEnabledToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :softphone_enabled, :boolean
    add_column :users, :softphone_id, :integer

    Softphone.scoped.each do |softphone|
      user = softphone.user
      user.softphone_id = softphone.id
      user.save(:validate => false)
    end
  end

  def self.down
    remove_column :users, :softphone_enabled
    remove_column :users, :softphone_id
  end
end
