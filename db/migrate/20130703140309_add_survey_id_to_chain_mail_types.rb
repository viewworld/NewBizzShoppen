class AddSurveyIdToChainMailTypes < ActiveRecord::Migration
  def self.up
    add_column :chain_mail_types, :type, :string
  end

  def self.down
    remove_column :chain_mail_types, :type
  end
end
