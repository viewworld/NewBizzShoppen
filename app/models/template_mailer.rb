class TemplateMailer
  attr_accessor :to, :email_template, :country, :options, :attachment_paths

  def initialize(to, email_template, country, options = {}, attachment_paths=[])
    @to = to
    @email_template = email_template
    @country = country
    @options = options
    @attachment_paths = attachment_paths
    I18n.locale = country.locale.to_sym
  end

  def delay!
    ApplicationMailer.delay.email_template(
        @to,
        @email_template,
        @country,
        @options,
        @attachment_paths
    )
  end
end