class AddSavingToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :saving, :string
    Deal.all.each do |deal|
      deal.update_attribute(:saving, deal._saving)
    end
  end

  def self.down
    remove_column :leads, :saving
  end
end
