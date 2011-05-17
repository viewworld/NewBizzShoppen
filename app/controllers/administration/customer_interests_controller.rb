class Administration::CustomerInterestsController < Administration::AdministrationController

  before_filter :fetch_user

  def edit
    @countries = Country.all
  end

  def update
    if @user.update_attributes(params[:user_customer])
      @user.check_and_correct_interests!
      flash[:notice] = I18n.t("flash.customer_interests.update.notice")
      redirect_to edit_administration_user_path(@user)
    else
      render :action => "edit"
    end
  end

  private

  def fetch_user
    @user = User.find(params[:id]).with_role
    unless @user.has_role?(:customer)
      redirect_to edit_administration_user_path(@user)
    end
  end
end