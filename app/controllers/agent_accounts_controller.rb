class AgentAccountsController < ApplicationController
  def new
    @user = User.new(:newsletter_on => true)
  end

  def create
    @user = User.new(params[:user])
    @user.roles << :agent

    respond_to do  |format|
    if @user.save
      format.html { redirect_to root_path }
    else
      format.html { render :action => "new" }
    end
    end
  end

end
