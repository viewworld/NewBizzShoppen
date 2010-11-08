class LocalesController < ApplicationController
  def show
    request.env["HTTP_REFERER"] = '/'
    set_locale(params[:id])
    redirect_to request.get? ? :back : root_path
  end
end
