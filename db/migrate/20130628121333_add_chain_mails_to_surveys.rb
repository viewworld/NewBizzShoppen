class AddChainMailsToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :link_clicked_chain_mail_type_id, :integer
    add_column :surveys, :link_not_clicked_chain_mail_type_id, :integer
    add_column :surveys, :link_not_clicked_chain_mail_delay, :integer, :default => 0
    add_column :survey_options, :chain_mail_type_id, :integer
    add_column :survey_recipients, :link_not_clicked_chain_mail_sent_at, :datetime, :default => nil
  end

  def self.down
    remove_column :surveys, :clicked_chain_mail_type_id
    remove_column :surveys, :not_clicked_chain_mail_type_id
    remove_column :surveys, :not_clicked_chain_delay
    remove_column :survey_options, :chain_mail_type_id
  end
end
