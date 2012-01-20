class Administration::StatsRecalculationController < Administration::AdministrationController

  def update
    %w{recalculate_leads_average_ratings refresh_subaccounts_counters refresh_agent_counters refresh_supplier_counters}.each do |stat_method|
      CommonStats.delay(:queue => 'caches').send(stat_method.to_sym)
    end

    flash[:notice] = I18n.t("flash.stats_recalculation.update.notice")
    redirect_to :back
  end
end