class LocalesController < ApplicationController
   skip_before_filter :set_locale

  def show
    set_locale(params[:id])
    redirect_to request.get? ? :back : root_path
  end
end
