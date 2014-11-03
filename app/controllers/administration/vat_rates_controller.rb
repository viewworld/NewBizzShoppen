class Administration::VatRatesController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'settings'
  set_subtab 'global'

  before_filter :set_vat_rate, only: [:edit, :update]
  before_filter :set_available_locales, only: [:new, :edit]

  def new
    @vat_rate = VatRate.new(country: Country.new)
  end

  def create
    @vat_rate = VatRate.new(new_vat_rate_params)

    common_save(@vat_rate, success: { redirect: edit_administration_setting_path })
  end

  def update
    @vat_rate.assign_attributes(vat_rate_params)

    common_save(@vat_rate, success: { redirect: edit_administration_setting_path })
  end

  private
  
  def set_vat_rate
    @vat_rate = VatRate.find(params[:id])
  end

  def set_available_locales
    @available_locales = Locale.where(enabled: true)
  end

  def new_vat_rate_params
    params.require(:vat_rate).permit(:rate, country_attributes: [:name, :locale, :detailed_locale])
  end

  def vat_rate_params
    params.require(:vat_rate).permit(:rate)
  end
end
