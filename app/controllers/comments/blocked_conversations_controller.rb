class Comments::BlockedConversationsController < Comments::CommentsController

  before_filter :fetch_comment

  def create
    @comment.block_user_from_conversation!
  end

  def destroy
    @comment.unblock_user_from_conversation!
  end

  private

  def fetch_comment
    @comment = current_user.comment_threads.find(params[:id])
  end
end