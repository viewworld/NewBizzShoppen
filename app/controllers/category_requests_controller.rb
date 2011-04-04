class CategoryRequestsController < ApplicationController
  before_filter :check_user_role
  set_tab "category_request"

  def new
    @email_template_preview = CategoryRequestTemplatePreview.new(:category_request, {:email_from => current_user.email, :phone_number => current_user.phone}, current_user)
  end

  def create
    params[:email_template_preview].tap do |email_params|
      @email_template_preview = CategoryRequestTemplatePreview.new(:category_request, email_params, current_user)
    end

      if @email_template_preview.valid?
        flash[:notice] = I18n.t("contact_us.create.flash.email_sent_successfully")
        ApplicationMailer.generic_email(["admin@fairleads.com"], @email_template_preview.subject, @email_template_preview.body, @email_template_preview.email_from).deliver

        redirect_to root_path
      else
        render :action => 'new'
      end
  end

  protected

  def check_user_role
    if current_user.nil? or !current_user.has_any_role?(:agent, :call_centre_agent, :purchase_manager, :customer, :lead_buyer)
      redirect_to root_path
    end
  end
end