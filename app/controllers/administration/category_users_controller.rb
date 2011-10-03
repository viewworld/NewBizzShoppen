class Administration::CategoryUsersController < Administration::AdministrationController

  def index
    @users = (params[:users_type] == "suppliers" ? User.with_suppliers : User.with_agents)
    @users = @users.where("first_name like :query or last_name like :query or email like :query", { :query => "%#{params[:query]}%" }) if params[:query]
  end
end