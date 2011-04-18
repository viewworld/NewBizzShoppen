class Threads::CommentsController < ApplicationController

  private

  def authorize_user_for_namespace!
    raise CanCan::AccessDenied unless user_signed_in?
  end

  def current_user
    User.find_by_id(super.id).with_role
  end

  public

  def index
    @threads = current_user.comment_threads
  end

  def show
    @thread = current_user.comment_threads.find(params[:id])
  end

  def create
    @thread = current_user.comment_threads.new(params[:comment].merge(:user_id => current_user.id))
    if @thread.save
      flash[:notice] = "successfully created"
    else
      flash[:alert] = "uuu something went wrong my dear"
    end
    redirect_to :back
  end

end