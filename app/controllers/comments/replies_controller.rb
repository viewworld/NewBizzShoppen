class Comments::RepliesController < Comments::CommentsController

  public

  def create
    attributes = params[:comment].merge(:user_id => current_user.id)
    @reply = current_user.comment_threads.new(attributes)
    respond_to do |wants|
      wants.js
    end
  end

  def new
    respond_to do |wants|
      wants.js
    end
  end

end