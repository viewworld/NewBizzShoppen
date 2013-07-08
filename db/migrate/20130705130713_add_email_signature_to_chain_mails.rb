class AddEmailSignatureToChainMails < ActiveRecord::Migration
  def self.up
    add_column :email_template_signatures, :name, :string
    add_column :chain_mail_types, :email_template_signature_id, :integer
  end

  def self.down
  end
end
