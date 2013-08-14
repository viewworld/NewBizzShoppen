class AddCreatorToChainMailTypes < ActiveRecord::Migration
  def self.up
    add_column :chain_mail_types, :creator_id, :integer
    add_column :chain_mail_types, :creator_type, :string
  end

  def self.down
    remove_column :chain_mail_types, :creator_id
    remove_column :chain_mail_types, :creator_type
  end
end
