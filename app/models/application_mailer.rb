class ApplicationMailer < ActionMailer::Base
  default :from => "Application <noreply@application.com>", :return_path => 'noreply@application.com'

  def email_template(to, email_template, options = {})
    subject = email_template.render_subject(options)
    body = email_template.render(options)
    mail(:to => to.blank? ? "fake@fake.com" : to, :subject => subject) do |format|
      format.html { render :text => body }
    end
  end

end