class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :title
      t.string :uuid
      t.integer :creator_id
      t.string :creator_type
      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
