class AddCurrencyIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :currency_id, :integer
  end

  def self.down
    remove_column :categories, :currency_id
  end
end
