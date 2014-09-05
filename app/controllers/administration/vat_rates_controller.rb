class Administration::VatRatesController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "global"

  before_filter :set_vat_rate, only: [:edit, :update]

  def new
    @vat_rate = VatRate.new(country: Country.new)
  end

  def create
    @vat_rate = VatRate.new(new_vat_rate_params)

    if @vat_rate.save
      redirect_to edit_administration_setting_path
    else
      render :new
    end
  end

  def update
    if @vat_rate.update_attributes(vat_rate_params)
      redirect_to edit_administration_setting_path
    else
      render :edit
    end
  end

  private
  def set_vat_rate
    @vat_rate = VatRate.find(params[:id])
  end

  def new_vat_rate_params
    params.require(:vat_rate).permit(:rate, country_attributes: [:name, :locale, :detailed_locale])
  end

  def vat_rate_params
    params.require(:vat_rate).permit(:rate)
  end
end
