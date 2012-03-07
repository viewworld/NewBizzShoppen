module EmailTemplatesActions
  def test_send_email
    unless params[:email].to_s.strip.blank?
      @email_template = EmailTemplate.find(params[:id])

      disclaimer = I18n.t("models.email_template.test_send_disclaimer")

      TemplateMailer.new(params[:email], :blank_template, Country.where(:locale => I18n.locale.to_s).first,
                               { :subject_content => StringUtils.replace_template_variables(params[:subject] || @email_template.subject),
                                 :body_content => StringUtils.replace_template_variables(params[:body] || @email_template.body) + "<h3>#{disclaimer}</h3>",
                                 :email_template_id => @email_template.id
                               }).deliver!
    end

    render :nothing => true
  end
end