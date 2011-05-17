class AgentAccountsController < SignInController

  def new
    super(User::Agent)
  end

  def create
    super(User::Agent, :user_agent, I18n.t("flash.agent_accounts.create.notice"))
  end

end
