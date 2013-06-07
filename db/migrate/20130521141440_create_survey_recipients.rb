class CreateSurveyRecipients < ActiveRecord::Migration
  def self.up
    create_table :survey_recipients do |t|
      t.integer :survey_id
      t.string :uuid
      t.datetime :visited_at, :default => nil
      t.datetime :completed_at, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_recipients
  end
end
