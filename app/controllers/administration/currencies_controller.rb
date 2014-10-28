class Administration::CurrenciesController < Administration::AdministrationController
  set_tab 'settings'
  set_subtab 'currencies'

  before_filter :set_currency, only: [:edit, :update, :destroy]

  def index
    @currencies = Currency.order('active DESC, symbol ASC').decorate
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      redirect_to administration_currencies_path
    else
      render :new
    end
  end

  def update
    if @currency.update_attributes(currency_params)
      redirect_to administration_currencies_path
    else
      render :edit
    end
  end

  def destroy
    if @currency.destroy
      redirect_to administration_currencies_path
    else
      redirect_to administration_currencies_path, alert: @currency.errors[:base].join('<br/>')
    end
  end

  private
  def set_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :symbol, :format, :separator, :delimiter, :unit_name, :subunit_name,
      :active, :global_default, :disabled)
  end
end
