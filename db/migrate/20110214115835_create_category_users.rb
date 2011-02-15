class CreateCategoryUsers < ActiveRecord::Migration
  def self.up
    create_table :category_users do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :user_type
      t.timestamps
    end
  end

  def self.down
    drop_table :category_users
  end
end
