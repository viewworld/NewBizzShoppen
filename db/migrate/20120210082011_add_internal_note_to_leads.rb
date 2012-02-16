class AddInternalNoteToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :internal_note, :text

    change_column :assets, :type, :string, :limit => 30
  end

  def self.down
    remove_column :leads, :internal_note
  end
end
