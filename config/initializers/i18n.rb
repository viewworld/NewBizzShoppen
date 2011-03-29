# ActiveRecord backend
require 'i18n/active_record'
I18n.backend = I18n::Backend::ActiveRecord.new

# Fallbacks
require "i18n/backend/fallbacks"
I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Fallbacks)
I18n.default_locale = :"en"

I18n.fallbacks[:en] = [:en, :dk]
I18n.fallbacks[:dk] = [:dk, :en]