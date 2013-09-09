class Api::ApiController < ActionController::Base
  before_filter :authenticate_by_api_key

  private

  def authenticate_by_api_key
    if user = User.find_by_api_key(params.delete(:api_key)).try(:with_role)
      sign_in(user)
    else
      render :text => 'Invalid API key', :status => 403
    end
  end
end