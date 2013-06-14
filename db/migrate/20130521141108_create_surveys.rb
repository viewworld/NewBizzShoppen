class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :name
      t.integer :creator_id
      t.string :creator_type
      t.string :newsletter_owner_email
      t.timestamps
    end

    create_table :newsletter_lists_surveys, :id => false do |t|
      t.integer :newsletter_list_id
      t.integer :survey_id
    end

    create_table :campaigns_surveys, :id => false do |t|
      t.integer :campaign_id
      t.integer :survey_id
    end

    add_column :result_fields, :survey_id, :integer, :default => nil
  end

  def self.down
    drop_table :surveys
    drop_table :newsletter_lists_surveys
    drop_table :campaigns_surveys

    remove_column :result_fields, :survey_id
  end
end
