class MoreLeadsRequestsController < ApplicationController
  before_filter :check_user_role
  before_filter :fetch_category
  set_tab "browse_leads"

  def new
    @email_template_preview = MoreLeadsRequestTemplatePreview.new(:more_leads_request,
                                                                 {
                                                                     :category_name => @category.name,
                                                                     :contact_email => (current_user ? current_user.email : ''),
                                                                     :contact_phone => (current_user ? current_user.phone : ''),
                                                                     :contact_name => (current_user ? current_user.screen_name : ''),
                                                                     :company_name => (current_user ? current_user.company_name : '')
                                                                 },
                                                                 current_user)
  end

  def create
    params[:email_template_preview].tap do |email_params|
      @email_template_preview = MoreLeadsRequestTemplatePreview.new(:more_leads_request, email_params.merge(:category_name => @category.name, :country => Country.get_country_from_locale), current_user)
    end

      if @email_template_preview.valid?
        flash[:notice] = I18n.t("more_leads_requests.create.flash.request_sent")
        ApplicationMailer.delay.email_template(Settings.contact_us_email, :blank_template, Country.get_country_from_locale,
                                       {:subject_content => @email_template_preview.subject, :body_content => @email_template_preview.body,
                                        :bcc_recipients => @email_template_preview.bcc, :cc_recipients => @email_template_preview.cc, :reply_to => @email_template_preview.contact_email})

        if current_user
          redirect_to current_user.has_any_role?(:agent, :call_centre_agent, :purchase_manager) ? agent_home_path : buyer_home_path
        else
          redirect_to root_path
        end
      else
        render :action => 'new'
      end
  end

  protected

  def check_user_role
    if (current_user and !current_user.has_any_role?(:customer, :lead_buyer))
      redirect_to root_path
    end
  end

  def fetch_category
    @category = LeadCategory.find(params[:category_id])
  end
end
