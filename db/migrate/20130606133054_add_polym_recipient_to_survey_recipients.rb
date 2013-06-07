class AddPolymRecipientToSurveyRecipients < ActiveRecord::Migration
  def self.up
    add_column :survey_recipients, :recipient_id, :integer
    add_column :survey_recipients, :recipient_type, :string
  end

  def self.down
  end
end
