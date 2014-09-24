class Administration::TranslationsController < Administration::AdministrationController
  set_tab 'content'
  set_subtab 'translations'

  def show
    params[:lang_1] ||= 'en'
    params[:lang_2] ||= 'da'

    # FIXME: Refactoring this probably will need some change in db
    @available_locales = Locale.all.map(&:pair).sort
    @locales = Locale.where(code: [params[:lang_1], params[:lang_2]])

    @search = Translation.scoped_search(params[:search])
    @search.without_proc = true

    @translations = @search.order('key ASC').group_by(&:key)
    @keys = @translations.keys

    @translations.each do |key, value|
      @translations[key] = value.group_by(&:locale)
    end
  end

  def update
    unless params[:value].blank?
      @translation = Translation.find_or_create_by_locale_and_key(params[:locale], params[:key])
      @translation.update_attribute(:value, params[:value])
    end

    respond_to do |format|
      format.js { render nothing: true }
    end
  end
end
