class TemplateMailer
  attr_accessor :to, :email_template, :country, :options, :attachment_paths

  def initialize(to, email_template, country, options = {}, attachment_paths=[])
    orig_locale = I18n.locale
    I18n.locale = country.locale.to_sym
    ApplicationMailer.email_template(
        to,
        email_template,
        country,
        options,
        attachment_paths
    )
    I18n.locale = orig_locale
  end

end
