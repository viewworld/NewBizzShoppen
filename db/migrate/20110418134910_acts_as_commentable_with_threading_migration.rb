class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.integer :commentable_id, :null => false
      t.string :commentable_type, :null => false
      t.string :title, :default => ""
      t.text :body, :null => false
      t.string :subject, :default => ""
      t.integer :user_id, :null => false
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, :commentable_id
  end
  
  def self.down
    drop_table :comments
  end
end
