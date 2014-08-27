class Administration::CurrenciesController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "currencies"

  before_filter :set_currency, only: [:edit, :update, :destroy]

  def index
    @currencies = Currency.order("active DESC, symbol ASC").decorate
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(params[:currency])

    if @currency.save
      redirect_to administration_currencies_path
    else
      render :new
    end
  end

  def update
    if @currency.update_attributes(params[:currency])
      redirect_to administration_currencies_path
    else
      render :edit
    end
  end

  def destroy
    if @currency.destroy
      redirect_to administration_currencies_path
    else
      binding.pry
      redirect_to administration_currencies_path, alert: @currency.errors[:base].join('<br/>')
    end
  end

  private
  def set_currency
    @currency = Currency.find(params[:id])
  end
end
