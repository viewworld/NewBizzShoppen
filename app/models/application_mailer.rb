class ApplicationMailer < ActionMailer::Base
  default :from => "Fairleads.com <noreply@#{ActionMailer::Base.default_url_options[:host]}>",
          :return_path => "noreply@#{ActionMailer::Base.default_url_options[:host]}"

  def email_template(to, email_template, options = {})
    subject = email_template.render_subject(options)
    body = email_template.render(options)
    mail(:to => to.blank? ? "fake@fake.com" : to, :subject => subject) do |format|
      format.html { render :text => body }
    end
  end

  def generic_email(recipients, subject, body, from=nil, attachment_paths=[])
    attachment_paths.each do |ap|
      attachments[ap.basename.to_s] = File.read(ap.to_s)
    end
    mail(:to => recipients.blank? ? "fake@fake.com" : recipients, :subject => subject, :from => from) do |format|
      format.html { render :text => body }
    end
  end

end