class Administration::CategoryUsersController < Administration::AdministrationController
  def index
    @users =
      if params[:users_type] == 'customers'
        User.with_suppliers
      else
        User.with_agents
      end

    @users = @users.where('first_name LIKE :query OR last_name LIKE :query OR email LIKE :query', { query: "%#{params[:query]}%" })
  end
end
