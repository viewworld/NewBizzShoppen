class CallersAdvancedExport < Struct.new(:params, :controller, :campaign)
  delegate :current_user, :to => :controller
  include ::Controllers::CampaignActions

  def perform
    @campaign = campaign
    set_locals(params[:advanced_export])
    call_result_ids = call_results_for(result_ids).map{|el| el[:ids]}.flatten
    ::Axlsx::Package.new do |package|
      package.workbook.add_worksheet(:name => I18n.t('advanced_export.create.summary')) do |sheet|
        sheet.add_row [I18n.t('campaigns.show.table.results'), @headers, I18n.t('campaigns.show.table.sum')].flatten
        @results.each do |result|
          cells = [result.name]
          cols = call_results_for([result.id]).map {|el| el[:number]}
          cells << cols
          cells << cols.sum
          sheet.add_row cells.flatten
        end

        cells = [I18n.t('campaigns.show.table.all_results')]
        cols = call_results_for(result_ids).map {|el| el[:number]}
        cells << cols
        cells << cols.sum
        sheet.add_row cells.flatten
      end

      @results.each do |result|
        package.workbook.add_worksheet(:name => result.name.first(30).gsub('/', '-').to_ascii) do |sheet|
          result_fields = ResultField.find_all_by_id(@result_fields["result_#{result.id}"])
          sheet.add_row((@contact_columns + result_fields.map(&:name)).map(&:humanize))

          result.call_results.find_all_by_id(call_result_ids).each do |call_result|
            cells = (@contact_columns.map do |attr|
              call_result.contact.send(attr).to_s.gsub(/[\n\r\t,]/, ' ')
            end + call_result.result_values.find_all_by_result_field_id(result_fields.map(&:id)).map do |rf|
              rf.value.to_s.gsub(/[\n\r\t,]/, ' ')
            end)
            sheet.add_row cells
          end
        end
      end
    end.to_stream.read
  end

  private

  def campaign_ids
    @campaign_ids ||= Array(@campaign.is_a?(Array) ? @campaign.map(&:id) : @campaign.id)
  end

  def result_ids
    @result_ids ||= @results.map(&:id)
  end

  def call_results_for(result_ids)
    CallResult.for_table_row(@date_from, @date_to, result_ids, @agent_ids, campaign_ids)
  end
end
