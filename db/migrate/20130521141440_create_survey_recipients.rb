class CreateSurveyRecipients < ActiveRecord::Migration
  def self.up
    create_table :survey_recipients do |t|
      t.integer :survey_id
      t.string :uuid
      t.integer :state, :default => 0
      t.integer :recipient_id
      t.string :recipient_type
      t.datetime :email_sent_at, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_recipients
  end
end
