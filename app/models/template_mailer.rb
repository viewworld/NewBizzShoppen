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
    I18n.with_locale(@country.locale.to_sym) do
      ApplicationMailer.email_template(
        @to,
        @email_template,
        @country,
        @options,
        @attachment_paths
      ).deliver
    end
  end

  unless Rails.env.development?
    handle_asynchronously :deliver!, :queue => Proc.new{|i| i.queue }, :run_at => Proc.new{|i| i.run_at }
  end
end
