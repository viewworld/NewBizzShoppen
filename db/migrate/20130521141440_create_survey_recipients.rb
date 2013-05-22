class CreateSurveyRecipients < ActiveRecord::Migration
  def self.up
    create_table :survey_recipients do |t|
      t.integer :survey_id
      t.string :email
      t.string :uuid
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_recipients
  end
end
