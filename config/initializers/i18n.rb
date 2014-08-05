unless Rails.env.test?
  # ActiveRecord backend
  require 'i18n/backend/active_record'
  I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Cache)
  I18n.backend = I18n::Backend::ActiveRecord.new
  I18n.cache_store = ActiveSupport::Cache.lookup_store(:memory_store)

  # Fallbacks
  require "i18n/backend/fallbacks"
  I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Fallbacks)
  I18n.default_locale = :"en"

  I18n.fallbacks[:en] = [:en, :da]
  I18n.fallbacks[:da] = [:da, :en]
end
