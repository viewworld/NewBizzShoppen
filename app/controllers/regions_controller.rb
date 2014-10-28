class RegionsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])

    respond_to do |format|
      format.html
      format.js
    end
  end
end
