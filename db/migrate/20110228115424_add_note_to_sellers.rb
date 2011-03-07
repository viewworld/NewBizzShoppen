class AddNoteToSellers < ActiveRecord::Migration
  def self.up
    add_column :sellers, :note, :text
  end

  def self.down
    remove_column :sellers, :note
  end
end
