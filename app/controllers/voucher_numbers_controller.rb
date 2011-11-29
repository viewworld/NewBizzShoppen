class VoucherNumbersController < SecuredController

  before_filter :set_role
  before_filter :set_object
  before_filter :check_permission_for_deal

  def current_user
    @user ||= ::User::CallCentre.find_by_id(super.id)
    @user ||= ::User::CallCentreAgent.find_by_id(super.id)
    @user ||= ::User::Admin.find_by_id(super.id)
    @user ||= ::User::Agent.find_by_id(super.id)
  end

  def edit
  end

  def update
    if @deal.update_attributes(params[:deal])
      flash[:notice] = I18n.t("voucher_numbers.update.flash.success")
      redirect_to edit_voucher_number_path(@deal)
    else
      render :edit
    end
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre, :call_centre_agent, :admin, :agent)
  end

  def set_role
    @role = if ::User::CallCentre.find_by_id(current_user.id)
              "call_centre"
            elsif ::User::CallCentreAgent.find_by_id(current_user.id)
              "call_centre_agent"
            elsif ::User::Admin.find_by_id(current_user.id)
              "admin"
            elsif ::User::Agent.find_by_id(current_user.id)
              "agent"
            end
  end

  def set_object
    @deal = Deal.find_by_id(params[:id])
  end

  def check_permission_for_deal
     raise CanCan::AccessDenied if @deal.blank? or !@deal.can_be_editable_by(current_user)
  end

end