class Administration::LanguagesController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "languages"

  def index
    @languages = Locale.all
  end

  def update
    @language = Locale.find(params[:id])

    # FIXME: Add notifications
    if @language.update_attributes(params[:language])
      redirect_to administration_languages_path
    else
      redirect_to administration_languages_path
    end
  end
end
