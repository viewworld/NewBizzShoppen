class RegionsController < ApplicationController
  def index
    @country = Country.find_by_id(params[:country_id])
  end
end