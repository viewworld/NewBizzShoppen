class AddCurrencyIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :currency_id, :integer
    if Currency.default_currency
      ActiveRecord::Migration.execute "UPDATE categories SET currency_id = #{Currency.default_currency.id} WHERE currency_id IS NULL AND type = 'LeadCategory'"
    end
  end

  def self.down
    remove_column :categories, :currency_id
  end
end
