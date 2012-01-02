class VoucherNumbersController < SecuredController

  before_filter :set_role
  before_filter :set_object
  before_filter :check_permission_for_deal
  before_filter :check_deal_maker_for_supplier

  def current_user
    @user ||= ::User::CallCentre.find_by_id(super.id)
    @user ||= ::User::CallCentreAgent.find_by_id(super.id)
    @user ||= ::User::Admin.find_by_id(super.id)
    @user ||= ::User::Agent.find_by_id(super.id)
    @user ||= ::User::Supplier.find_by_id(super.id)
  end

  def edit
  end

  def update
    result = []
    params[:deal][:voucher_numbers_attributes].each_value{|v| result << v["number"]}
    result.compact!
    if result.size == result.uniq.size
      if @deal.update_attributes(params[:deal])
        flash[:notice] = I18n.t("voucher_numbers.update.flash.success")
        redirect_to edit_voucher_number_path(@deal)
      else
        render :edit
      end
    else
      flash[:notice] = I18n.t("voucher_numbers.update.flash.the_same_number")
      redirect_to edit_voucher_number_path(@deal)
    end
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre, :call_centre_agent, :admin, :agent, :supplier)
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
            elsif ::User::Supplier.find_by_id(current_user.id)
              "supplier"
            end
  end

  def set_object
    @deal = Deal.find_by_id(params[:id])
  end

  def check_permission_for_deal
    raise CanCan::AccessDenied if @deal.blank? or !@deal.can_be_editable_by(current_user)
  end

  def check_deal_maker_for_supplier
    raise CanCan::AccessDenied if @user and @user.supplier? and !@user.deal_maker?
  end

end