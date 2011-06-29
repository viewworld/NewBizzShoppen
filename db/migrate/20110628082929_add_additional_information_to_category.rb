class AddAdditionalInformationToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :additional_information, :text
  end

  def self.down
    remove_column :categories, :additional_information
  end
end
