class AgentAccountsController < ApplicationController
  def new
    @user = User::Agent.new(:newsletter_on => true)
  end

  def create
    @user = User::Agent.new(params[:user_agent])
    respond_to do |format|
      format.html { @user.save ? redirect_to(root_path) : render("new") }
    end
  end

end
