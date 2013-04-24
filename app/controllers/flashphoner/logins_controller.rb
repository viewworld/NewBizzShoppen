class Flashphoner::LoginsController < ApplicationController
  respond_to :xml

  def show
    @user = User.find_by_phone_token(params[:token])
  end

end