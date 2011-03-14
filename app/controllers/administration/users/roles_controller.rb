class Administration::Users::RolesController < Administration::AdministrationController

  def create
    User.find(params[:user_id]).with_role.update_attributes(:roles_to_add => params[:roles])
    redirect_to :back
  end

  def destroy
    u = User.find(params[:user_id]).with_role.update_attributes(:roles_to_remove => params[:roles])
    redirect_to :back
  end

end