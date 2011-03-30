class I18nUtils

  def self.extract_i18n_keys(hash, parent_keys = [])
    hash.inject({}) do |keys, (key, value)|
      full_key = parent_keys + [key]
      if value.is_a?(Hash)
        keys.merge!(extract_i18n_keys(value, full_key))
      elsif !value.nil?
        keys[full_key.join(".")] = value
      end
      keys
    end
  end

  def self.parse(hash)
    processed, created = 0, 0
    raise InvalidLocaleFile if hash.keys.size != 1
    locale = hash.keys.first
    puts "Locale found: #{locale}"
    I18nUtils.extract_i18n_keys(hash[locale]).each do |key,value|
      processed += 1
      unless Translation.where(:locale => locale, :key => key).first
        Translation.create!(:locale => locale, :key => key, :value => value)
        created += 1
      end
    end
    puts "Processed keys: #{processed}"
    puts "Created records: #{created}"
  end

  def self.populate
    t0 = Time.now
    Dir.open('./config/locales').each do |name|
      if File.file?("./config/locales/#{name}")
        puts "Processing file #{name} ..."
        I18nUtils.parse(YAML::load_file("./config/locales/#{name}"))
        puts "Processed in #{Time.now-t0}s"
      end
    end
    puts "Done. Total time spent #{Time.now-t0}s"
  end

  def self.store_in_hash(arr, hash, value)
    first_elem = arr.shift
    if arr.empty?
      hash[first_elem] = value
    else
      hash[first_elem] = {} unless hash[first_elem]
      hash[first_elem] = self.store_in_hash(arr, hash[first_elem], value)
    end
    hash
  end

  def self.export_for_js!(selector)
    h = {}
    Translation.where("key LIKE :selector", {:selector => "%#{selector}%"}).each do |t|
      self.store_in_hash(([t.locale] + t.key.split('.')), h, t.value)
    end
    f = File.open('./public/javascripts/translations.js', 'w')
    f << "var I18n = I18n || {};" << "I18n.translations = " << h.to_json << ";"
    f.close
  end

end