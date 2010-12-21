module LeadsHelper
  def leads_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/leads/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def leads_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:lead_details, :tools, :bottom)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/leads/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def leads_listing_header
    header = if params[:search].is_a?(Hash)
      (['bestsellers','latest','featured'] & params[:search].keys).first
    else
      nil
    end
    header ? t("leads.index.#{header}_header") : t("leads.index.header")
  end

  def lead_status(lead)
    case lead.published
      when false then t("administration.leads.index.view.option_not_published")
      when true then t("administration.leads.index.view.option_published")
    end
  end

  def administration_lead_statuses
    [
        [t("administration.leads.index.view.option_not_published"), false],
        [t("administration.leads.index.view.option_published"), true]
    ]
  end

  def status_or_status_change(lead)
    if lead.created_by?('PurchaseManager')
      select_tag :published,
                  options_for_select(administration_lead_statuses, lead.published),
                  :onchange => "$.post('#{administration_lead_path(lead)}', {'format':'js', '_method':'put', 'lead[published]':this.value} );"
    else
      lead_status(lead)
    end
  end

  def categories_for_select
    Category.roots.map{|c| [c.name,c.id]}
  end

  def statuses_for_select
    [
        [t("administration.leads.index.view.option_not_published"), 0],
        [t("administration.leads.index.view.option_published"), 1]
    ]
  end

  def currencies_for_select
    Currency.active.map{|c| [c.name,c.id]}
  end

  def creator_types
    Lead.select("DISTINCT creator_type").map{|ct| ct.creator_type.split('::').last}
  end

end