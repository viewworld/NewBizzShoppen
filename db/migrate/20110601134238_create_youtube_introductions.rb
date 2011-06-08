class CreateYoutubeIntroductions < ActiveRecord::Migration
  def self.up
    create_table :youtube_introductions do |t|
      t.string :url
      t.string :locale_code
      t.timestamps
    end
  end

  def self.down
    drop_table :youtube_introductions
  end
end
