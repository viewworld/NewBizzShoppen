class Callers::ProductionController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  include ::Controllers::CampaignActions

  before_filter :set_campaign, :only => [:show,:export]

  def export
    set_locals
    @call_result_ids = CallResult.for_table_row(@date_from, @date_to, @results.map(&:id), @agent_ids, @campaign.is_a?(Array) ? @campaign.map(&:id) : @campaign.id).map{|hash| hash[:ids]}.flatten

    respond_to do |wants|
      wants.csv { send_data CallResult.to_csv(@call_result_ids), :filename => "call_result.csv" }
      wants.xls { send_data render_to_string, :filename => "call_result.xls" }
    end

  end

end