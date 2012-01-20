class TemplateMailer
  attr_accessor :to, :email_template, :country, :options, :attachment_paths

  def initialize(to, email_template, country, options = {}, attachment_paths=[])
    @to = to
    @email_template = email_template
    @country = country
    @options = options
    @attachment_paths = attachment_paths
  end

  def deliver!
    orig_locale = I18n.locale
    I18n.locale = @country.locale.to_sym
    ApplicationMailer.email_template(
        @to,
        @email_template,
        @country,
        @options,
        @attachment_paths
    ).deliver
    I18n.locale = orig_locale
  end
  handle_asynchronously :deliver!, :queue => 'emails'

end
