class AddSettingsToCampaignsReports < ActiveRecord::Migration
  def self.up
    add_column :campaigns_results, :settings, :text
    add_column :results, :settings, :text
    upgraded_to_lead = Result.find_by_name('Upgraded to lead')
    upgraded_to_lead.settings = {
      "use_value_as_lead_price" => { "type" => "boolean", "value" => "1" },
      "prompt_for_price" => { "type" => "boolean", "value" => "0" },
      "prompt_for_country" => { "type" => "boolean", "value" => "0" },
      "prompt_for_published" => { "type" => "boolean", "value" => "0" },
      "prompt_for_purchase_value" => { "type" => "boolean", "value" => "0" },
      "prompt_for_hidden_description" => { "type" => "boolean", "value" => "0" },
      "prompt_for_currency" => { "type" => "boolean", "value" => "0" },
      "prompt_for_additional_language" => { "type" => "boolean", "value" => "0" },
      "prompt_for_decision_date" => { "type" => "boolean", "value" => "0" },
      "prompt_for_sale_limit" => { "type" => "boolean", "value" => "0" },
    }
    upgraded_to_lead.save
  end

  def self.down
    remove_column :campaigns_results, :settings
    remove_column :results, :settings
  end
end
