class AddSessionsTable < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.string :session_id, :null => false, :limit => nil
      t.text :data
      t.timestamps
    end

    ActiveRecord::Migration.execute("ALTER TABLE sessions ALTER COLUMN session_id TYPE character varying")

    add_index :sessions, :session_id
    add_index :sessions, :updated_at
  end

  def self.down
    drop_table :sessions
  end
end
