class HomeController < ApplicationController

  set_tab "home"

  def show
    @categories = LeadCategory.roots.without_locked.without_unique.order("name ASC")
  end

end
