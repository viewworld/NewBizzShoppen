class AddSiteToYoutubeInstroductions < ActiveRecord::Migration
  def self.up
    add_column :youtube_introductions, :site, :string
    execute "UPDATE youtube_introductions SET site = 'fairleads'"
  end

  def self.down
    remove_column :youtube_introductions, :site
  end
end
