require "i18n/backend/fallbacks"
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.default_locale = :"en"

I18n.fallbacks[:en] = [:en, :dk]
I18n.fallbacks[:dk] = [:dk, :en]