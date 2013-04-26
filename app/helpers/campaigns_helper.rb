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

  def display_result_value(result)
    return "-" if result.nil?
    case result.field_type.to_i
      when ResultField::MATERIAL then result.materials.map{|material| link_to(material.asset_file_name, material.url) }.join(", ").html_safe
      else result.value
    end
  end

  def call_url(call_id)
    @calls ||= Dir.entries(File.join(Rails.root,'public/system/calls'))
    if filename = @calls.detect{|f| f.match(/#{call_id}\.(mp4|wav)$/)}
      "/system/calls/#{filename}"
    else
      nil
    end
  end

  def link_to_call(call_id)
    @calls ||= Dir.entries(File.join(Rails.root,'public/system/calls'))
    if fileurl = call_url(call_id)
      bt_link_to :download, fileurl[/(mp4|wav)$/,1], fileurl
    end
  end

end