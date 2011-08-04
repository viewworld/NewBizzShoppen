class ApplicationMailer < ActionMailer::Base
  default :from => "Fairleads.com <admin@fairleads.com>",
          :return_path => "admin@fairleads.com"

  def email_template(to, email_template, options = {})
    options[:country] = Country.find_by_locale(I18n.locale)
    subject = email_template.render_subject(options)
    body = email_template.render(options)
    bcc_recipients = options.delete(:bcc_recipients) || email_template.bcc
    cc_recipients = options.delete(:cc_recipients) || email_template.cc
    mail(:to => to.blank? ? "fake@fake.com" : to, :subject => subject, :cc => cc_recipients, :bcc => bcc_recipients, :reply_to => reply_to) do |format|
      format.html { render :text => body }
    end
  end

  def generic_email(recipients, subject, body, from=nil, attachment_paths=[], cc_recipients=nil, bcc_recipients=nil, reply_to=nil)
    #attachment_paths.each do |ap|
    #  attachments[ap.basename.to_s] = File.read(ap.to_s)
    #end
    mail(:to => recipients.blank? ? "fake@fake.com" : recipients,
         :subject => subject,
         :reply_to => reply_to,
         :cc => cc_recipients,
         :bcc => bcc_recipients,
         :postmark_attachments => attachment_paths.map{|ap| File.open(ap)} ) do |format|
      format.html { render :text => body }
    end
  end

end