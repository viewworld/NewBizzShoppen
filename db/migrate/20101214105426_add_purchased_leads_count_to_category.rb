class AddPurchasedLeadsCountToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :published_leads_count, :integer, :default => 0
    Category.where({}).each{|c| c.send :refresh_published_leads_count_cache!}
  end

  def self.down
    remove_column :categories, :published_leads_count
  end
end
