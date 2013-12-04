class MyProfileController < SecuredController
  inherit_resources
  actions :all, :except => [:update]
  before_filter :redirect_if_my_profile_hidden
  before_filter :cache_referer_deal_id
  skip_before_filter :redirect_to_paypal_confirmation

  def show

  end

  def resource
    @user = current_user
  end

  def update
    if current_user.member?
      if params[:user_member] && ActiveRecord::ConnectionAdapters::Column.value_to_boolean(params[:user_member][:unsubscribe_and_close_account])
        current_user.unsubscribe_and_close_account!
        sign_out current_user
        redirect_to root_path
        return
      end
    end

    @user = current_user
    if @user.update_attributes(params["user_#{@user.role.to_s}".to_sym])
      flash[:notice] = I18n.t("my_profile.update.controller.successful_update_notice")
      if @user.contact.present? and @user.has_any_role?(:category_supplier, :supplier, :member) and @user.sign_in_count == 1
        unless session[:user_confirmed_account_info] == "1"
          @user.deliver_welcome_email_for_upgraded_contact
          session[:user_confirmed_account_info] = "1"
        end
        redirect_to @user.has_role?(:category_supplier) ? category_home_page_path(:slug => @user.buying_categories.first.cached_slug) : @user.has_role?(:supplier) ? supplier_home_path : root_path
      else
        redirect_to root_path
      end
    else
      render :action => 'edit'
    end
  end

  def social_link
    data = params[:token] ? RPXNow.user_data(params[:token], :raw_response => true)['profile'] : nil
    unless data[:identifier].blank?
      current_user.update_attribute(:rpx_identifier, data[:identifier])
      flash[:notice] = I18n.t("my_profile.social_link.controller.successful_link_notice", :account_type => User.social_provider(current_user.rpx_identifier))
    end
    redirect_to my_profile_path
  end

  def unlink
    @user = current_user
  end

  def social_unlink
    @user = current_user
    @user.update_attributes(params["user_#{@user.role}".to_sym])
    if !params["user_#{@user.role}".to_sym][:password].blank? and @user.save
      temp_rpx_identifier = @user.rpx_identifier
      @user.update_attribute(:rpx_identifier, nil)
      flash[:notice] = I18n.t("my_profile.social_unlink.controller.successful_unlink_notice", :account_type => User.social_provider(temp_rpx_identifier))
      redirect_to my_profile_path
    else
      render :action => 'unlink'
    end
  end

  def remove_category_supplier
    flash[:notice] = current_user.remove_category_supplier ? t("my_profile.change_to_supplier.controller.success") : t("my_profile.change_to_supplier.controller.failure")
    redirect_to my_profile_path
  end

  def unsubscribe
    @user = current_user
  end

  protected

  def redirect_if_my_profile_hidden
    if current_user and current_user.hide_profile_page?
      redirect_to root_path
    end
  end

  def cache_referer_deal_id
    if params[:deal_id]
      @deal = Deal.without_inactive.find_by_id(params[:deal_id])
      session[:deal_id] = @deal.id if @deal
    end
  end
end
