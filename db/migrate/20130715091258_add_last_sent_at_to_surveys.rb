class AddLastSentAtToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :last_sent_at, :datetime
    add_column :surveys, :last_sent_recipients_count, :integer
  end

  def self.down
    remove_column :surveys, :last_sent_at
    remove_column :surveys, :last_sent_recipients_count
  end
end
