class AgentAccountsController < ApplicationController
  def new
    @user = User.new(:newsletter_on => true)
  end

  def create
    @user = User.new(params[:user])
    @user.roles = [:agent]
    respond_to do |format|
      format.html { @user.save ? redirect_to(root_path) : render("new") }
    end
  end

end
