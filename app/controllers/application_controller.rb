class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
     if resource.is_a?(User)
       if resource.has_role? :admin
        administration_root_path
       else
        self.send "#{resource.roles.first.to_s}_root_path"
       end
     else
       super
     end
   end
end
