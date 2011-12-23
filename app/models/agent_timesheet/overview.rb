class AgentTimesheet::Overview

  include AgentTimesheet

  def datasource
    AgentTimesheet::View::OverviewView.show_weekends(@show_weekends).for_campaigns(@campaigns)
  end


end