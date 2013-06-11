class AddSurveyIdToResultFields < ActiveRecord::Migration
  def self.up
    add_column :result_fields, :survey_id, :integer, :default => nil
  end

  def self.down
  end
end
