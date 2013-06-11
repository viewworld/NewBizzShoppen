class CreateSoftphoneServers < ActiveRecord::Migration
  def self.up
    create_table :softphone_servers do |t|
      t.string :name
      t.string :server_host
      t.integer :server_port, :default => 1935
      t.string :sip_domain
      t.string :sip_port, :default => 5060
      t.timestamps
    end
    SoftphoneServer.create!(:name => '24native, Copenhagen, Denmark', :server_host => '192.168.0.10', :sip_domain => '192.168.0.25')
    SoftphoneServer.create!(:name => 'Hetzner, Germany', :server_host => '144.76.32.51', :sip_domain => 'sipproxy.firstcom.dk')
    add_column :users, :softphone_server_id, :integer
  end

  def self.down
    drop_table :softphone_servers
    remove_column :users, :softphone_server_id
  end
end
