module NewsHelper
  def news_header
    if params[:search].is_a?(Hash)
      if common = (['for_purchase_manager','for_agent','for_buyer'] & params[:search].keys) and common.any?
        t("news.index.view.#{common.first.sub(/for_/,'').pluralize}_header")
      end
    end
  end

  def news_scope_for_select
    [
      [I18n.t('administration.news.index.view.agents'),Article::News::AGENT],
      [I18n.t('administration.news.index.view.buyers'),Article::News::BUYER],
      [I18n.t('administration.news.index.view.purchase_managers'),Article::News::PURCHASE_MANAGER]
    ]
  end

  def st(text, sanitize_options={},truncate_options={})
    sanitize_options = {:tags=>[],:attributes=>[]}.merge(sanitize_options)
    truncate_options = {:length=>380,:omission=>"... (#{t('common.read_more')})"}.merge(truncate_options)
    raw truncate(sanitize(text, sanitize_options), truncate_options)
  end

end