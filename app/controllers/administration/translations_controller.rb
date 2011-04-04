class Administration::TranslationsController < Administration::AdministrationController
  set_tab "content"
  set_subtab "translations"

  private

  def collection
    @locales = Locale.all.map(&:code)
    @keys = Translation.select("DISTINCT(key)").order("key ASC").map(&:key)
    @translations = Translation.select("locale,key,value").group_by(&:locale)
    @translations.each do |k,v|
      @translations[k] = @translations[k].group_by(&:key)
    end
  end

  public

  def show
    collection
  end

  def update
    @translation = Translation.find_or_create_by_locale_and_key(params[:locale],params[:key])
    respond_to do |wants|
      wants.js
    end
  end
end