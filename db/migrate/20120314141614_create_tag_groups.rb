class CreateTagGroups < ActiveRecord::Migration
  def self.up
    create_table :tag_groups do |t|
      t.boolean :match_all, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_groups
  end
end
