class CategoryRequestsController < ApplicationController
  before_filter :check_user_role
  set_tab "browse_leads"

  def new
    @email_template_preview = CategoryRequestTemplatePreview.new(:category_request,
                                                                 {:email_from => (current_user ? current_user.email : ''), :phone_number => (current_user ? current_user.phone : '')},
                                                                 current_user)
  end

  def create
    params[:email_template_preview].tap do |email_params|
      @email_template_preview = CategoryRequestTemplatePreview.new(:category_request, email_params.merge(:country => Country.get_country_from_locale), current_user)
    end

      if @email_template_preview.valid?
        flash[:notice] = I18n.t("category_requests.create.flash.request_sent")
        TemplateMailer.delay.new(Settings.contact_us_email, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => @email_template_preview.subject, :body_content => @email_template_preview.body,
                                        :bcc_recipients => @email_template_preview.bcc, :cc_recipients => @email_template_preview.cc,
                                        :reply_to => @email_template_preview.email_from, :sender_id => User.get_current_user_id,
                                        :email_template_uniq_id => "category_request"})

        if current_user
          redirect_to current_user.has_any_role?(:agent, :call_centre_agent, :member) ? agent_home_path : supplier_home_path
        else
          redirect_to root_path
        end
      else
        render :action => 'new'
      end
  end

  protected

  def check_user_role
    if (current_user and !current_user.has_any_role?(:agent, :call_centre_agent, :member, :supplier, :lead_supplier))
      redirect_to root_path
    end
  end
end