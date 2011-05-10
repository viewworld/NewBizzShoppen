class CreateCommentReaders < ActiveRecord::Migration
  def self.up
    create_table :comment_readers do |t|
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comment_readers
  end
end
