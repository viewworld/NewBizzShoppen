class Administration::LanguagesController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'settings'
  set_subtab 'languages'

  def index
    @languages = Locale.all
  end

  def update
    @language = Locale.find(params[:id])
    @language.assign_attributes(language_params)

    common_save(@language,
      success: { redirect: administration_languages_path },
      failure: { redirect: administration_languages_path }
    )
  end

  private

  def language_params
    params.require(:language).permit(:enabled)
  end
end
