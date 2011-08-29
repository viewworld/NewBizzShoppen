class RemoveIndexForCategoriesCachedSlug < ActiveRecord::Migration
  def self.up
    remove_index "categories", ["cached_slug"]
  end

  def self.down
  end
end
