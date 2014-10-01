class ChangeSoftphoneEnabledToSharedSoftphoneEnabledOnUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :softphone_enabled, :shared_softphone_enabled

    Softphone.all.each do |softphone|
      u = softphone.user;
      u.softphone_id = softphone.id;
      u.save(:validate => false)
    end
  end

  def self.down
    rename_column :users, :shared_softphone_enabled, :softphone_enabled
  end
end
