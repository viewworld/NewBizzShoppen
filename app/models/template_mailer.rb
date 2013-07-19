class TemplateMailer
  attr_accessor :to, :email_template, :country, :options, :attachment_paths, :queue, :run_at

  def initialize(to, email_template, country, options = {}, attachment_paths=[])
    @queue = options[:queue] || 'emails'
    @run_at = options[:run_at] || Time.now
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
  unless Rails.env.development?
    handle_asynchronously :deliver!, :queue => Proc.new{|i| i.queue }, :run_at => Proc.new{|i| i.run_at }
  end
end
