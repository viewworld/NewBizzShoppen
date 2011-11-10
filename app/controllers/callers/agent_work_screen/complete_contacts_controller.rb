class Callers::AgentWorkScreen::CompleteContactsController < Callers::AgentWorkScreenController

  def show
    set_locals
    add_completed_to_locals
  end

end
