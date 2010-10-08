class Administration::AdministrationController < ApplicationController
  def current_user
    #Second request is cached so only class-casting occurs
    @admin ||= ::User::Admin.find(super.id)
  end
end