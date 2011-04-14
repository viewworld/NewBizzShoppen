module CampaignsHelper

  def campaigns_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    render(:partial => '/callers/campaigns/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def contacts_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools, :bottom)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    options[:agent_work_screen] ||= false    
    render(:partial => '/callers/contacts/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def call_results_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:status_column, :tools)
    block.call(@hb)
    options[:show_checkboxes] ||= false
    options[:agent_work_screen] ||= false
    render(:partial => '/callers/call_results/table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

end