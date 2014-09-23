class CreateSoftphones < ActiveRecord::Migration
  def self.up
    create_table :softphones do |t|
      t.string :name
      t.string :sip_username
      t.string :sip_password
      t.string :softphone_server_id
      t.integer :user_id
      t.timestamps
    end

    (User.with_role(:agent).where("coalesce(sip_username) != '' AND coalesce(sip_password) != ''") +
     User.with_role(:call_centre).where("coalesce(sip_username) != '' AND coalesce(sip_password) != ''") +
     User.with_role(:call_centre_agent).where("coalesce(sip_username) != '' AND coalesce(sip_password) != ''")).uniq.each do |user|
       user.softphones.create(:name => 'Custom',
                              :sip_username => user.sip_username,
                              :sip_password => user.sip_password,
                              :softphone_server_id => user.softphone_server_id)
    end
  end

  def self.down
    drop_table :softphones
  end
end
