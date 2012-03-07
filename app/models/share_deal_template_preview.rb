class ShareDealTemplatePreview < EmailTemplatePreview
  include ActiveModel::Validations
  attr_accessor :email_from
  validates_presence_of :email_from, :body, :subject


  def initialize(email_template_uniq_id, email_from, options = {})
    @email_template = EmailTemplate.find_by_uniq_id(email_template_uniq_id.to_s)
    @email_template.preview = true
    self.body = @email_template.render(options)
    self.subject = @email_template.render_subject(options.stringify_keys)
    self.email_from = email_from
    self.cc = @email_template.cc
    self.bcc = @email_template.bcc
    self.email_template_id = @email_template.id
  end
end