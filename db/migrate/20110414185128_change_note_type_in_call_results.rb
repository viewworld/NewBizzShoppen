class ChangeNoteTypeInCallResults < ActiveRecord::Migration
  def self.up
    change_column :call_results, :note, :text
  end

  def self.down
    change_column :call_results, :note, :string
  end
end
