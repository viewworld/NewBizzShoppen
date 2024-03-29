class ChainMailer
  attr_accessor :to, :country, :options, :attachment_paths, :queue, :run_at

  def initialize(to, chain_mail, country, options = {}, attachment_paths=[])
    @queue = options[:queue] || 'chain_mail'
    @run_at = options[:run_at] || Time.now
    @to = to
    @country = country
    @options = options
    @options[:signature] = chain_mail.chain_mail_type.email_template_signature
    @attachment_paths = attachment_paths
    @chain_mail = chain_mail
  end

  def deliver!
    if @chain_mail.keep_sending?
      I18n.with_locale(@country.locale.to_sym) do
        ApplicationMailer.email_template(
          @to,
          :blank_template,
          @country,
          @options,
          @attachment_paths
        ).deliver
      end
      @chain_mail.email_sent!(:position => @options[:position])
    else
      @chain_mail.destroy
    end
  end

  unless Rails.env.development?
    handle_asynchronously :deliver!, :queue => Proc.new{|i| i.queue }, :run_at => Proc.new{|i| i.run_at }
  end
end
