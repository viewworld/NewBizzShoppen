class AddCurrencyIdToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :currency_id, :integer

    ActiveRecord::Migration.execute "UPDATE campaigns SET currency_id = #{Currency.default_currency.present? ? Currency.default_currency.id : Currency.active.first.id} WHERE currency_id IS NULL"
  end

  def self.down
    remove_column :campaigns, :currency_id
  end
end
