class Callers::AgentInformationsController < Callers::CallerController

  def show
    @currency = Currency.find_by_id(params[:currency_id]) || Currency.euro
  end

end
