class AddUuidToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :uuid, :string
  end

  def self.down
    remove_column :surveys, :uuid
  end
end
