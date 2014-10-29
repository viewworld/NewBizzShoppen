class PhoneCodesController < ApplicationController
  def index
    @country = Country.find_by_id(params[:country_id])
    respond_to do |format|
      format.js
      format.html
    end
  end
end
