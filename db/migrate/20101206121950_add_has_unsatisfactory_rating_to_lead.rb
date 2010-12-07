class AddHasUnsatisfactoryRatingToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :has_unsatisfactory_rating, :boolean, :default => false
  end

  def self.down
    remove_column :leads, :has_unsatisfactory_rating
  end
end
