class RemoveUnusedIndexesOnLeads < ActiveRecord::Migration
  def self.up
    # no scans at all
    execute %{
      DROP INDEX index_leads_on_creator_name;
      DROP INDEX index_leads_on_currency_id;
      DROP INDEX index_leads_on_has_unsatisfactory_rating;
      DROP INDEX index_leads_on_header;
      DROP INDEX index_leads_on_sale_limit;
    }
    # less than 100 scans a day
    execute %{
      DROP INDEX index_leads_on_country_id;
      DROP INDEX index_leads_on_created_at;
      DROP INDEX index_leads_on_price;
      DROP INDEX index_leads_on_purchase_value;
      DROP INDEX index_leads_on_region_id;
    }
  end

  def self.down
  end
end
