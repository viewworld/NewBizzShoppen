class Administration::SupplierInterestsController < Administration::AdministrationController
  before_filter :set_user, only: [:edit, :update]

  def edit
    @countries = Country.all
  end

  def update
    if @user.update_attributes(params[:user_supplier])
      @user.try(:check_and_correct_interests!)
      redirect_to edit_administration_user_path(@user), notice: t('flash.supplier_interests.update.notice')
    else
      render :edit
    end
  end

  private
  def set_user
    # FIXME: I guess only suppliers should be allowed, yet CategorySupplier is allowed too
    # FIXME: (According to CategorySupplier not having check_and_coorect_interests! method)

    @user = User.find(params[:id]).with_role
    redirect_to edit_administration_user_path(@user) unless @user.has_role?(:supplier)
  end
end
