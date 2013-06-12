class CreateSurveyQuestions < ActiveRecord::Migration
  def self.up
    create_table :survey_questions do |t|
      t.integer :survey_id
      t.string :title
      t.integer :question_type
      t.integer :position
      t.boolean :is_required, :default => false
      t.boolean :is_branched, :default => false
      t.boolean :is_multi, :default => false
      t.integer :parent_id
      t.integer :branch_option_id
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_questions
  end
end
