class HomeController < ApplicationController

  set_tab "home"

  def show
    @categories = Category.order("name ASC")
  end

end
