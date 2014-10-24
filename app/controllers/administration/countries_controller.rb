class Administration::CountriesController < Administration::AdministrationController
  set_tab 'settings'
  set_subtab 'countries'

  before_filter :set_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
    @country.email_template_signature = EmailTemplateSignature.new
  end

  def create
    @country = Country.new(country_params)
    @country.email_template_signature.name = "Email template signature for #{@country.name}"

    if @country.save
      redirect_to administration_countries_path
    else
      render :new
    end
  end

  def update
    if @country.update_attributes(country_params)
      redirect_to administration_countries_path
    else
      render :edit
    end
  end

  def destroy
    if @country.destroy
      redirect_to administration_countries_path
    else
      redirect_to administration_countries_path, alert: @country.errors[:base].join('<br/>')
    end
  end

  private
  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :locale, :detailed_locale, :work_start_at, :work_end_at, email_template_signature_attributes: [:body], regions_attributes: [:name])
  end
end
