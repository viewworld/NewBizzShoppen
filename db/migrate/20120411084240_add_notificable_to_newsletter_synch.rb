class AddNotificableToNewsletterSynch < ActiveRecord::Migration
  def self.up
    add_column :newsletter_synches, :notificable_type, :string
    add_column :newsletter_synches, :notificable_id, :integer
  end

  def self.down
    remove_column :newsletter_synches, :notificable_id
    remove_column :newsletter_synches, :notificable_type
  end
end
