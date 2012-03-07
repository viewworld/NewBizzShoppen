class MoreLeadsRequestTemplatePreview < EmailTemplatePreview
  include ActiveModel::Validations
  attr_accessor :category_name, :company_name, :contact_name, :contact_email, :contact_phone, :note
  validates_presence_of :company_name, :contact_name, :contact_email, :contact_phone
  validates_format_of :contact_email, :allow_blank => false, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


  def initialize(email_template_uniq_id, params, user, options = {})
    @email_template = EmailTemplate.find_by_uniq_id(email_template_uniq_id.to_s)
    @email_template.preview = true
    params.each_pair do |method, value|
      self.send("#{method}=".to_sym, value)
    end
    self.body = @email_template.render(options.merge({:category_name => category_name, :company_name => company_name, :contact_name => contact_name,
                                                      :contact_email => contact_email, :contact_phone => contact_phone, :note => note,
                                                      :country => country}))
    self.subject = @email_template.render_subject(options)
    self.cc = [@email_template.cc, contact_email].compact
    self.bcc = @email_template.bcc
    self.email_template_id = @email_template.id
  end
end