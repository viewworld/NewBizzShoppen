class CreateLeadsLeadTemplates < ActiveRecord::Migration
  def self.up
    create_table :leads_lead_templates, :id => false do |t|
      t.integer :lead_id
      t.integer :lead_template_id
    end
  end

  def self.down
  end
end
