class AddSiteToYoutubeInstroductions < ActiveRecord::Migration
  def self.up
    add_column :youtube_introductions, :site, :string
  end

  def self.down
    remove_column :youtube_introductions, :site
  end
end
