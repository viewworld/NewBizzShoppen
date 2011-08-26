class Languages < Thor
  require File.expand_path('config/environment.rb')

  desc "languages", ""

  def seed

  end

  desc "languages", ""

  def dk_to_da
    ['article_translations', 'category_translations', 'email_template_translations', 'lead_template_field_translations',
     'lead_template_translations', 'lead_template_value_translations', 'lead_translations', 'translations'].each do |t|
      ActiveRecord::Base.connection.execute("UPDATE #{t} SET locale = 'da' WHERE locale = 'dk'")
    end

    ActiveRecord::Base.connection.execute("UPDATE youtube_introductions SET locale_code = 'da' WHERE locale_code = 'dk'")
    ActiveRecord::Base.connection.execute("UPDATE countries SET locale = 'da' WHERE locale = 'dk'")
  end

end

