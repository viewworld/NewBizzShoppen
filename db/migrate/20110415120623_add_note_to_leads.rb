class AddNoteToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :note, :text
  end

  def self.down
    remove_column :leads, :note, :text
  end
end
