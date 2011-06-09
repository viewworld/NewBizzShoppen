class AddLastCallResultAtToContacts < ActiveRecord::Migration
  def self.up
    add_column :leads, :last_call_result_at, :datetime
  end

  def self.down
    remove_column :leads, :last_call_result_at
  end
end
