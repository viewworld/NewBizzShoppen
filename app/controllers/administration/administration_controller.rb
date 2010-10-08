class Administration::AdministrationController < ApplicationController
  def current_user
    @admin ||= ::User::Admin.find(super.id)
  end
end