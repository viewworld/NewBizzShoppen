class CreateCategoriesSurveys < ActiveRecord::Migration
  def self.up
    create_table :categories_surveys, :id => false do |t|
      t.integer :category_id
      t.integer :survey_id
    end
  end

  def self.down
    drop_table :categories_surveys
  end
end
