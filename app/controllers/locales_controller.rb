class LocalesController < ApplicationController
  def show
    set_locale(Locale.new(params[:id]))
    redirect_to request.get? ? :back : root_path
  end
end
