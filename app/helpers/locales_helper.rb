module LocalesHelper
  def image_tag_for_locale
    image_tag("languages/flag_#{I18n.locale}.png")
  end
end
