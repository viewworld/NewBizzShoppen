class AgentTimesheet::Overview

  include AgentTimesheet

  def scoped_view
    AgentTimesheet::TimeView.show_weekends(@show_weekends).for_campaigns(@campaigns).for_agents(@agents)
  end


end