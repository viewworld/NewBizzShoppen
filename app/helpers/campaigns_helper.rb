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
      when ResultField::SURVEY then result.survey_answers.map(&:to_s).join("; ")
      else result.value
    end
  end

  def call_url(call_id)
    if !call_id.blank? and (filename = find_call_file_by_call_id(call_id)) and !filename.blank?
      filename.split.first.gsub('public','')
    else
      nil
    end
  end

  def link_to_call(call_id)
    if fileurl = call_url(call_id)
      bt_link_to :download, fileurl[/(mp4|wav)$/,1], fileurl
    end
  end

  def results_for_select(campaign)
    CallResult.joins(:result, :contact).
        select("DISTINCT(results.id) as result_id, results.name as result_name").reorder("results.name").
        where(:leads => { :campaign_id => campaign.id }).map{ |cr| [cr.result_name, cr.result_id] }
  end

  def agents_for_select(campaign)
    User.select("DISTINCT(users.id), users.first_name, users.company_name, users.parent_id").
        joins("INNER JOIN call_results ON call_results.creator_id = users.id INNER JOIN leads ON leads.id = call_results.contact_id").
        where("leads.campaign_id = ?", campaign.id).
        map{ |u| [u.screen_name, u.id] }
  end

  def states_for_select
    (['all']+Campaign::STATES).map{|s| [s.humanize, s]}
  end

  private

  def find_call_file_by_call_id(call_id)
    call_records.grep(/#{call_id}/).first
  end

  def call_records
    Rails.cache.fetch('call_records', :expires_in => 1.hour) do
      Dir['public/system/calls/*.*']
    end
  end
end
