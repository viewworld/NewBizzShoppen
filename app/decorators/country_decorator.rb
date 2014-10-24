class CountryDecorator < ApplicationDecorator
  def locale_info
    "#{locale}#{'-' + detailed_locale.upcase if detailed_locale.present?}"
  end
end
