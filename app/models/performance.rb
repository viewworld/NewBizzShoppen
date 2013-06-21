class Performance < AgentPerformance

  def value
    @value ||= currency.from_euro(values.sum(:value))
  end

  def cost
    @cost ||= currency.from_euro(costs.sum(:cost))
  end

  def total
    @total = value - cost
  end

  def value_rate
    time > 0 ? value / time : 0
  end

  def payout_rate
    time > 0 ? payout / time : 0
  end

  def result_count
    results.sum(:results)
  end

  def flot_days
    {
        :value => values.select("created_at, sum(value) as value").group("created_at").reorder("created_at").map{|v| [v.created_at.to_time.to_i*1000, currency.from_euro(v.value)]},
        :cost => costs.select("created_at, sum(cost) as cost").group("created_at").reorder("created_at").map{|c| [(c.created_at.to_time.to_i+jitter)*1000, currency.from_euro(c.cost)]},
    }
  end

  private

  def user_session_logs
    @user_session_logs ||= UserSessionLog.for_campaigns(campaigns).campaign_type.started_between(date_from, date_to)
  end

  def payouts
    @payouts ||= ::AgentTimesheet::Payout.for_campaigns(campaigns).created_between(date_from, date_to)
  end

  def values
    @values ||= ::AgentTimesheet::Value.for_campaigns(campaigns).created_between(date_from, date_to)
  end

  def costs
    @costs ||= ::AgentTimesheet::Cost.for_campaigns(campaigns).created_between(date_from, date_to)
  end

  def results
    @results ||= ::AgentTimesheet::Results.for_campaigns(campaigns).created_between(date_from, date_to)
  end

end