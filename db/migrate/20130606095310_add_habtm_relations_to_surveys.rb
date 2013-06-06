class AddHabtmRelationsToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :newsletter_owner_email, :string

    create_table :newsletter_lists_surveys, :id => false do |t|
      t.integer :newsletter_list_id
      t.integer :survey_id
    end

    create_table :campaigns_surveys, :id => false do |t|
      t.integer :campaign_id
      t.integer :survey_id
    end
  end

  def self.down
  end
end
