class AddPhoneToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_enabled, :boolean, :default => false
    add_column :users, :sip_username, :string
    add_column :users, :sip_domain, :string
    add_column :users, :sip_password, :string
    add_column :users, :sip_authentication_name, :string
    add_column :users, :sip_outbound_proxy, :string
    add_column :users, :sip_port, :integer
  end

  def self.down
    remove_column :users, :phone_enabled
    remove_column :users, :sip_username
    remove_column :users, :sip_domain
    remove_column :users, :sip_password
    remove_column :users, :sip_authentication_name
    remove_column :users, :sip_outbound_proxy
    remove_column :users, :sip_port
  end
end
