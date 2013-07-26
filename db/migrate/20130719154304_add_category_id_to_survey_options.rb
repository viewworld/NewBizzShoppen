class AddCategoryIdToSurveyOptions < ActiveRecord::Migration
  def self.up
    add_column :survey_options, :category_id, :integer
  end

  def self.down
    remove_column :survey_options, :category_id
  end
end
