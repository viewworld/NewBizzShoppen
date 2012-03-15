class EmailTemplatePreview
  attr_accessor :recipients, :body, :subject, :invoice_filename, :cc, :bcc, :country, :email_template_id
  def initialize(email_template_uniq_id, options = {})
    @email_template = EmailTemplate.find_by_uniq_id(email_template_uniq_id.to_s)
    @email_template.preview = true
    self.body = @email_template.render(options)
    self.subject = @email_template.render_subject(options.stringify_keys)
    self.cc = @email_template.cc
    self.bcc = @email_template.bcc
    self.email_template_id = @email_template.id
  end
end