class RemoveRpxFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :rpx_identifier
  end
end
