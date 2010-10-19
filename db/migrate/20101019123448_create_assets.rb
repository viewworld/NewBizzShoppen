class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.string :asset_type
      t.datetime :asset_updated_at
    end
  end

  def self.down
    drop_table :assets
  end
end
