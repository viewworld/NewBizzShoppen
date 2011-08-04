class DealComments::RepliesController < DealComments::DealCommentsController

  public

  def create
    attributes = params[:comment].merge(:user_id => current_user.id)
    @reply = current_user.deal_comment_threads.new(attributes)
  end

end