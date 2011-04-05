class Administration::TranslationsController < Administration::AdministrationController
  set_tab "content"
  set_subtab "translations"

  private

  def collection
    @locales = Locale.all.map(&:code)
    @search = Translation.scoped_search(params[:search])
    @translations = @search.select("locale,key,value").order("key ASC").group_by(&:key)
    @keys = @translations.keys
    @translations.each do |k,v|
      @translations[k] = v.group_by(&:locale)
    end
  end

  public

  def show
    collection
  end

  def update
    @translation = Translation.find_or_create_by_locale_and_key(params[:locale],params[:key])
    @translation.update_attribute(:value, params[:value])
    respond_to do |wants|
      wants.js {
        render :nothing => true
      }
    end
  end
end