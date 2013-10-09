class AddDescriptionToNewsletterLists < ActiveRecord::Migration
  def self.up
    add_column :newsletter_lists, :description, :text
  end

  def self.down
    remove_column :newsletter_lists, :description
  end
end
