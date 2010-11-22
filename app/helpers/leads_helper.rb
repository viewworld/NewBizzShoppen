module LeadsHelper
  def leads_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/leads/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def leads_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:left, :right)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/leads/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def leads_listing_header
    if params[:search].is_a?(Hash)
      header = (['bestsellers','latest','featured'] & params[:search].keys).first
      header ? t("leads.index.#{header}_header") : nil
    end
  end

  def administration_lead_status(lead)
    case lead.published
      when false then t("administration.leads.index.view.option_not_published")
      when true then t("administration.leads.index.view.option_published")
    end
  end

end