class HomeController < ApplicationController
  def index
    throw current_user.class.name
  end
end
