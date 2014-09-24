class Administration::SupplierInterestsController < Administration::AdministrationController
  before_filter :set_user, only: [:edit, :update]

  def edit
    @countries = Country.all
  end

  def update
    if @user.update_attributes(params[:user_supplier])
      @user.check_and_correct_interests!
      redirect_to edit_administration_user_path(@user), notice: t('flash.supplier_interests.update.notice')
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id]).with_role
    redirect_to edit_administration_user_path(@user) unless @user.has_role?(:supplier)
  end
end
