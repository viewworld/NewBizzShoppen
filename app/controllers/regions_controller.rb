class RegionsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @regions = @country.regions

    respond_to do |format|
      format.html
      format.json { render json: @regions, only: [:id, :name] }
    end
  end
end
