class AddNoteFieldToNewsletterListSubscribers < ActiveRecord::Migration
  def self.up
    add_column :newsletter_list_subscribers, :note, :text
  end

  def self.down
    remove_column :newsletter_list_subscribers, :note
  end
end
