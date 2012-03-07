class CategoryRequestTemplatePreview < EmailTemplatePreview
  include ActiveModel::Validations
  attr_accessor :email_from, :category_name, :lead_description, :leads_count_per_month, :can_be_contacted, :phone_number
  validates_presence_of :email_from, :category_name, :lead_description, :leads_count_per_month, :phone_number


  def initialize(email_template_uniq_id, params, user, options = {})
    @email_template = EmailTemplate.find_by_uniq_id(email_template_uniq_id.to_s)
    @email_template.preview = true
    params.each_pair do |method, value|
      self.send("#{method}=".to_sym, value)
    end
    self.can_be_contacted = params[:can_be_contacted].to_i == 1
    self.body = @email_template.render(options.merge({:category_name => category_name, :lead_description => lead_description, :phone_number => phone_number,
                                                      :leads_count_per_month => leads_count_per_month, :can_be_contacted => can_be_contacted ? I18n.t("models.category_request_template.yes") : I18n.t("models.category_request_template.no"),
                                                      :request_type => (user.nil? ? I18n.t("models.category_request_template.guest") : user.has_any_role?(:agent, :call_centre_agent, :member) ? I18n.t("models.category_request_template.agent") : I18n.t("models.category_request_template.supplier")),
                                                     :country => country}))
    self.subject = @email_template.render_subject(options)
    self.cc = @email_template.cc
    self.bcc = @email_template.bcc
    self.email_template_id = @email_template.id
  end
end