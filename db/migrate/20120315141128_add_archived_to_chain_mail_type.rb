class AddArchivedToChainMailType < ActiveRecord::Migration
  def self.up
    add_column :chain_mail_types, :archived, :boolean, :default => false
  end

  def self.down
    remove_column :chain_mail_types, :archived
  end
end
