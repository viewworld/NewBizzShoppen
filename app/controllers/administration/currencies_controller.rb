class Administration::CurrenciesController < Administration::AdministrationController
  include Controllers::CommonActions

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

    common_save(@currency, success: { redirect: administration_currencies_path })
  end

  def update
    @currency.assign_attributes(currency_params)

    common_save(@currency, success: { redirect: administration_currencies_path })
  end

  def destroy
    common_destroy(@currency, success: { redirect: administration_currencies_path })
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :symbol, :format, :separator, :delimiter,
      :unit_name, :subunit_name, :active, :global_default, :disabled)
  end
end
