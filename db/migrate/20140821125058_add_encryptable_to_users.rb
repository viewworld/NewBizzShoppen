class AddEncryptableToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_salt if ActiveRecord::Base.connection.column_exists?(:users, :password_salt)

    change_table(:users) do |t|
      t.encryptable
    end
  end
end
