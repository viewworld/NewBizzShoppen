class HomeController < ApplicationController

  set_tab "home"

  def show
    @categories = Category.without_locked.without_unique.order("name ASC")
  end

end
