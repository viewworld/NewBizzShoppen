class EmailTemplatePreview
  attr_accessor :recipients, :body, :subject
  def initialize(email_template_uniq_id, options = {})
    @email_template = EmailTemplate.find_by_uniq_id(email_template_uniq_id.to_s)
    self.body = @email_template.render(options)
    self.subject = @email_template.render_subject(options)     
  end
end