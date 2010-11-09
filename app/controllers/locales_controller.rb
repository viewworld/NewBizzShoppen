class LocalesController < ApplicationController
  def show
    if ENV["RAILS_ENV"] == 'test'
    request.env["HTTP_REFERER"] = '/'
    end
    set_locale(params[:id])
    redirect_to request.get? ? :back : root_path
  end
end
