class CreateChainMailItems < ActiveRecord::Migration
  def self.up
    create_table :chain_mail_items do |t|
      t.integer :chain_mail_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :chain_mail_items
  end
end
