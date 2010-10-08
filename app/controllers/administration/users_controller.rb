class Administration::UsersController < Administration::AdministrationController

  def index
    throw current_user.class.name
  end

end