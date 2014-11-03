class Administration::CountriesController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'settings'
  set_subtab 'countries'

  before_filter :set_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.scoped.decorate
  end

  def new
    @country = Country.new
    @country.email_template_signature = EmailTemplateSignature.new
  end

  def create
    @country = Country.new(country_params)
    @country.email_template_signature.name = t('activerecord.models.email_template_signature.default_name', subject: @country.name)

    common_save(@country, success: { redirect: administration_countries_path })
  end

  def update
    @country.assign_attributes(country_params)

    common_save(@country, success: { redirect: administration_countries_path })
  end

  def destroy
    common_destroy(@country, success: { redirect: administration_countries_path })
  end

  private

  def set_country
    @country = Country.find(params[:id]).decorate
  end

  def country_params
    params.require(:country).permit(:name, :locale, :detailed_locale,
      :work_start_at, :work_end_at, email_template_signature_attributes: [:body, :id],
      regions_attributes: [:name, :id, :_destroy])
  end
end
