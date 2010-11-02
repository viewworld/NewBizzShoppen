class AddTotalLeadsCountToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :total_leads_count, :integer, :default => 0
    Category.where({}).each{|c| c.send :refresh_leads_count_cache!}
  end

  def self.down
    remove_column :categories, :total_leads_count
  end
end
