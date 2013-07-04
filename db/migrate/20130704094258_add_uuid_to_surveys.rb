class AddUuidToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :uuid, :string

    Survey.all.each { |s| s.send(:set_uuid); s.save }
  end

  def self.down
    remove_column :surveys, :uuid
  end
end
