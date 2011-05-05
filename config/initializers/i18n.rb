# ActiveRecord backend
require 'i18n/active_record'
I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Cache)
I18n.backend = I18n::Backend::ActiveRecord.new
#if Rails.env.production?
#  I18n.cache_store = ActiveSupport::Cache.lookup_store(:mem_cache_store)
#else
#  I18n.cache_store = ActiveSupport::Cache.lookup_store(:memory_store)
#end

# Fallbacks
require "i18n/backend/fallbacks"
I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Fallbacks)
I18n.default_locale = :"en"

I18n.fallbacks[:en] = [:en, :dk]
I18n.fallbacks[:dk] = [:dk, :en]