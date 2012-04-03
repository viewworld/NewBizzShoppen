class AddResultIdToChainMailTypes < ActiveRecord::Migration
  def self.up
    add_column :chain_mail_types, :result_id, :integer, :default => nil
  end

  def self.down
    remove_column :chain_mail_types, :result_id
  end
end
