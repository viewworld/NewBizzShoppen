class AddSurveyIdToChainMailTypes < ActiveRecord::Migration
  def self.up
    add_column :chain_mail_types, :type, :string

    ActiveRecord::Migration.execute "UPDATE chain_mail_types SET type = 'CampaignChainMailType' WHERE type IS NULL"
  end

  def self.down
    remove_column :chain_mail_types, :type
  end
end
