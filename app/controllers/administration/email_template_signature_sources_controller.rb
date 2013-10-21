class Administration::EmailTemplateSignatureSourcesController < ApplicationController
  layout false

  inherit_resources
  defaults :resource_class => EmailTemplateSignature
  actions :show

  private

  def resource
    @email_template_signature = EmailTemplateSignature.find(params[:id])
  end

end

