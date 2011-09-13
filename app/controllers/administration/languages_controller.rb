class Administration::LanguagesController < Administration::AdministrationController
  inherit_resources
  set_tab "settings"
  set_subtab "languages"

  def update
    update! do |success,failure|
      success.html { redirect_to administration_languages_path }
      failure.html { redirect_to administration_languages_path }
    end
  end

  private

  def collection
    @languages = Locale.all
  end

  def resource
    @language = Locale.find(params[:id])
  end

end