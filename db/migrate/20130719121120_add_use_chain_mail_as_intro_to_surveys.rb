class AddUseChainMailAsIntroToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :use_chain_mail_as_intro_mail, :boolean, :default => false

    execute "UPDATE surveys SET use_chain_mail_as_intro_mail = 'f' WHERE use_chain_mail_as_intro_mail IS NULL"

    remove_column :surveys, :link_not_clicked_chain_mail_type_id
    remove_column :surveys, :link_not_clicked_chain_mail_delay
  end

  def self.down
    remove_column :surveys, :use_chain_mail_as_intro_mail
  end
end
