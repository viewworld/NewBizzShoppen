class Devise::SessionsController < ApplicationController
  prepend_before_filter :require_no_authentication, :only => [:new, :create]
  include Devise::Controllers::InternalHelpers
  skip_before_filter :redirect_to_paypal_confirmation

  # GET /resource/sign_in
  def new
    unless params[:token].blank?
      data = session[:rpx_data]
      @failed_rpx = true
      flash[:alert] = nil
      @first_name = data['name']['givenName']
      @rpx_identifier = data['identifier']

      user = User.find_by_email(data['verifiedEmail']) unless data.blank?
      if user
        user.update_attribute(:rpx_identifier, data['identifier'])
        flash[:notice] = t("devise.sessions.new.controller.successfully_connect_to_social", :first_name => user.first_name, :account_type => User.social_provider(user.rpx_identifier), :email => user.email)
        sign_in(user)
        return redirect_to root_path
      end
    end
    clean_up_passwords(build_resource)
    render_with_scope :new
  end

  # POST /resource/sign_in
  def create
    resource = request.xhr? ? warden.authenticate(:scope => resource_name) : warden.authenticate!(:scope => resource_name, :recall => "new")
    set_flash_message :notice, :signed_in
    session[:rpx_data] = nil

    if request.xhr? and resource
      @user = resource.with_role
      if @deal = Deal.find_by_id(params[:deal_request_id])
        @lead = Lead.new
        @lead.based_on_deal(@deal, @user)
      end
    end

    resource.chain_mails.update_all("last_login_at = '#{Time.now}'") if resource

    deal = params[:deal_request_id] ? Deal.without_inactive.find_by_id(params[:deal_request_id]) : nil

    respond_to do |format|
      format.html {
        if deal
          sign_in(resource)
          redirect_to deal_path(deal)
        else
          sign_in_and_redirect(resource_name, resource)
        end
      }
      format.js { sign_in(resource) if resource }
    end
  end

  # GET /resource/sign_out
  def destroy
    set_flash_message :notice, :signed_out if signed_in?(resource_name)
    sign_out_and_redirect(resource_name)
  end
end
