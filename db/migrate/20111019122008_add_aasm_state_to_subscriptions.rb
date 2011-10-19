class AddAasmStateToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :aasm_state, :string
  end

  def self.down
    remove_column :subscriptions, :aasm_state
  end
end
