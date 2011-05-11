class Comments::CommentReadersController < Comments::CommentsController

  def create
    @lead = Lead.find(params[:lead_id])
    @lead.comment_threads.unread_by_user(current_user).each { |c| c.comment_readers.create(:user => current_user) }
    render :nothing => true
  end
end