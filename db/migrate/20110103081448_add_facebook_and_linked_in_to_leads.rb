class AddFacebookAndLinkedInToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :linkedin_url, :string
    add_column :leads, :facebook_url, :string
  end

  def self.down
  end
end
