class AddWelcomeAndThankYouPagesToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :welcome_page, :text
    add_column :surveys, :thank_you_page, :text
  end

  def self.down
    remove_column :surveys, :welcome_page
    remove_column :surveys, :thank_you_page
  end
end
