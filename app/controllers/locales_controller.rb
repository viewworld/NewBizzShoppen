class LocalesController < ApplicationController

  def show
    set_locale(Locale.new(params[:id]))
    if request.get?
      redirect_to :back
    else
      redirect_to root_path
    end
  end
end
