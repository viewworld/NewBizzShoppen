class CreateBlockedConversations < ActiveRecord::Migration
  def self.up
    create_table :blocked_conversations do |t|
      t.integer :agent_id
      t.integer :buyer_id
      t.integer :lead_id

      t.timestamps
    end
  end

  def self.down
    drop_table :blocked_conversations
  end
end
