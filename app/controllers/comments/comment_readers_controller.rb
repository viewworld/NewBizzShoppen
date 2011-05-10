class Comments::CommentReadersController < Comments::CommentsController

  def create
    @lead = Lead.find(params[:lead_id])
    current_user.comment_threads.where("commentable_id = ?", params[:lead_id]).unread.each { |c| c.comment_readers.create(:user => current_user) }
    render :nothing => true
  end
end