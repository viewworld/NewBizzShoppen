class AdvancedExport
  include AgentTimesheetCommon
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :result_ids, :campaign_ids, :date_from, :date_to, :agent_ids

  def initialize(params)
    @result_ids = (params[:result_ids] || []).map(&:to_i)
    @campaign_ids = params[:campaign_ids]
    @agent_ids = params[:agent_ids]
    @date_from = params[:date_from]
    @date_to = params[:date_to]
  end

  def persisted?
    false
  end
end