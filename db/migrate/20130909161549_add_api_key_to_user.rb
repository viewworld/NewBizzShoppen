class AddApiKeyToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :api_key, :string
    User.all.each do |user|
      execute("UPDATE users SET api_key='#{SecureRandom.hex(8)}' WHERE id = #{user.id}")
    end
  end

  def self.down
    remove_column :users, :api_key
  end
end
