module NewsHelper
  def news_header
    if params[:search].is_a?(Hash) and params[:search][:with_subclass].present?
      t("news.index.view.#{params[:search][:with_subclass].underscore.pluralize}_header")
    end
  end

  def news_scope_for_select
    [
      [I18n.t('administration.news.index.view.agents'),'Agent'],
      [I18n.t('administration.news.index.view.suppliers'),'Supplier'],
      [I18n.t('administration.news.index.view.members'),'Member'],
      [I18n.t('administration.news.index.view.category_homes'),'CategoryHome']
    ].sort
  end

  def st(text, sanitize_options={},truncate_options={})
    sanitize_options = {:tags=>[],:attributes=>[]}.merge(sanitize_options)
    truncate_options = {:length=>280, :omission=>"..."}.merge(truncate_options)
    raw truncate(sanitize(text, sanitize_options), truncate_options)
  end

end