class Callers::AgentWorkScreen::PendingCallsController < Callers::AgentWorkScreenController

  def show
    set_locals
    add_pending_to_locals
  end

end
