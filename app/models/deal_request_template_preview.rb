class DealRequestTemplatePreview < EmailTemplatePreview
  include ActiveModel::Validations

  attr_accessor :email_from, :name, :phone_number, :deal_description
  validates_presence_of :email_from, :name, :phone_number, :deal_description

  def initialize(email_template_uniq_id, params, user, options = {})
    @email_template = EmailTemplate.find_by_uniq_id(email_template_uniq_id.to_s)
    @email_template.preview = true
    params.each_pair do |method, value|
      self.send("#{method}=".to_sym, value)
    end

    self.body = @email_template.render(options.merge({:email_from => email_from, :name => name, :phone_number => phone_number, :deal_description => deal_description}))
    self.subject = @email_template.render_subject(options.merge({:name => name}).stringify_keys)
    self.cc = @email_template.cc
    self.bcc = @email_template.bcc
    self.email_template_id = @email_template.id
  end

end