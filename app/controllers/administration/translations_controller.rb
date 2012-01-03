class Administration::TranslationsController < Administration::AdministrationController
  set_tab "content"
  set_subtab "translations"

  private

  def collection
    params[:lang_1] ||= 'en'
    params[:lang_2] ||= 'da'
    @languages = Locale.where(:code => [params[:lang_1],params[:lang_2]])
    @search = Translation.scoped_search(params[:search])
    @search.without_proc = true
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
    unless params[:value].blank?
      @translation = Translation.find_or_create_by_locale_and_key(params[:locale],params[:key])
      @translation.update_attribute(:value, params[:value])
    end
    respond_to do |wants|
      wants.js {
        render :nothing => true
      }
    end
  end
end