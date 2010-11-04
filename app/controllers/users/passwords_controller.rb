class Users::PasswordsController < Devise::PasswordsController

  def update
    self.resource = User::Abstract.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      set_flash_message :notice, :updated
      sign_in_and_redirect(resource_name, resource)
    else
      render_with_scope :edit
    end
  end
end