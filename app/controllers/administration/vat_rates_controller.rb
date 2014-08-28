class Administration::VatRatesController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "global"

  before_filter :set_vat_rate, only: [:edit, :update]

  def new
    @vat_rate = VatRate.new
  end

  def create
    @vat_rate = VatRate.new(params[:vat_rate])

    if @vat_rate.save
      redirect_to edit_administration_setting_path
    else
      render :new
    end
  end

  def update
    if @vat_rate.update_attributes(params[:vat_rate])
      redirect_to edit_administration_setting_path
    else
      render :edit
    end
  end

  private
  def set_vat_rate
    @vat_rate = VatRate.find(params[:id]).includes(:country)
  end
end
