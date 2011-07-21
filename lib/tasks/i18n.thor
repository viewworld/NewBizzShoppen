class I18n < Thor
  require File.expand_path('config/environment.rb')

  desc "internationalization", ""

  def js
    puts " :: updating translations... :: "
    I18nUtils.populate!
    puts " :: exporting js translations... :: "
    I18nUtils.export_for_js!("common.js")
  end
end