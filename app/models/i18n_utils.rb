class I18nUtils

  def self.extract_i18n_keys(hash, parent_keys = [])
    hash.inject([]) do |keys, (key, value)|
      full_key = parent_keys + [key]
      if value.is_a?(Hash)
        keys += extract_i18n_keys(value, full_key)
      elsif !value.nil?
        keys << {full_key.join(".") => value}
      end
      keys
    end
  end

  def self.parse(hash)
    locale = hash.keys.first
    I18nUtils.extract_i18n_keys(hash[locale]).each do |translation|
      t = Translation.find_or_create_by_locale_and_key(locale, translation.keys.first)
      t.update_attributes(:value => translation.values.first) if !t.value.eql?(translation.values.first)
    end
  end

  def self.populate
    Dir.open('./config/locales').each do |name|
      I18nUtils.parse(YAML::load_file("./config/locales/#{name}")) if File.file?("./config/locales/#{name}")
    end
  end

end