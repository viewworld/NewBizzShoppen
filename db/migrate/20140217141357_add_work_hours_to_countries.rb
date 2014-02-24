class AddWorkHoursToCountries < ActiveRecord::Migration
  def self.up
    add_column :countries, :work_start_at, :time, :default => (Time.zone.at(0) + 8.hours)
    add_column :countries, :work_end_at, :time, :default => (Time.zone.at(0) + 15.hours + 24.minutes)
    Country.update_all(:work_start_at => (Time.zone.at(0) + 8.hours))
    Country.update_all(:work_end_at => (Time.zone.at(0) + 15.hours + 24.minutes))
  end

  def self.down
    remove_column :countries, :work_end_at
    remove_column :countries, :work_start_at
  end
end
