class CreateCategoryAgents < ActiveRecord::Migration
  def self.up
    create_table :category_agents do |t|
      t.integer :category_id
      t.integer :user_id
    end
  end

  def self.down
  end
end
