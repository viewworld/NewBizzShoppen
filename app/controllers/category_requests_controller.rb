class CategoryRequestsController < ApplicationController

  def new
    @email_template_preview = ContactUsTemplatePreview.new(:contact_us, current_user.email)
  end

  def create
    params[:email_template_preview].tap do |email_params|
      @email_template_preview = ContactUsTemplatePreview.new(:contact_us, email_params[:email_from])
      @email_template_preview.subject = email_params[:subject]
      @email_template_preview.body = email_params[:body]
    end

      if @email_template_preview.valid?
        flash[:notice] = I18n.t("contact_us.create.flash.email_sent_successfully")
        params[:email_template_preview].tap do |email_params|
          ApplicationMailer.generic_email(["tomasz.noworyta@gmail.com"], email_params[:subject], email_params[:body], email_params[:email_from]).deliver
        end
        redirect_to root_path
      else
        render :action => 'new'
      end

  end
end