class LocalesController < ApplicationController
  def show
    set_locale(params[:id])
    redirect_to request.get? ? :back : root_path
  end
end
