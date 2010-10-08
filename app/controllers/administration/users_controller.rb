class Administration::UsersController < Administration::AdministrationController
  inherit_resources
  load_and_authorize_resource
end