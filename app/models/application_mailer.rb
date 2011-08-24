class ApplicationMailer < ActionMailer::Base
  default :from => "Fairleads.com <admin@fairleads.com>",
          :return_path => "admin@fairleads.com"

  def email_template(to, email_template, country, options = {}, attachment_paths=[])
    I18n.locale = country.locale.to_sym
    email_template = email_template.is_a?(Symbol) ? EmailTemplate.find_by_uniq_id(email_template) : email_template
    email_template.preview = true if options[:preview] == true
    options.merge!(:country => country)

    subject = email_template.render_subject(options.stringify_keys)
    body = email_template.render(options)
    bcc_recipients = options.delete(:bcc_recipients) || email_template.bcc
    cc_recipients = options.delete(:cc_recipients) || email_template.cc
    reply_to = options.delete(:reply_to)

    if Rails.env.development?
      attachment_paths.each do |ap|
        attachments[ap.basename.to_s] = File.read(ap.to_s)
      end
    end

    mail(:to => to.blank? ? "fake@fake.com" : to,
         :subject => subject,
         :cc => cc_recipients,
         :bcc => bcc_recipients,
         :reply_to => reply_to,
         :postmark_attachments => attachment_paths.map{|ap| File.open(ap)}) do |format|
      format.html { render :text => body }
    end
  end
end
