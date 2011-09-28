class CreateContactPastUserAssignments < ActiveRecord::Migration
  def self.up
    create_table :contact_past_user_assignments do |t|
      t.integer :contact_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
  end
end
