class Flashphoner::LoginsController < ApplicationController
  respond_to :xml

  def show
    if @user = User.find_by_phone_token(params[:token])
      @user.update_attribute(:phone_token, nil)
    end
  end

end