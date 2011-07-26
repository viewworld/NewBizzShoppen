class DealComments::CommentReadersController < DealComments::DealCommentsController

  def create
    @deal = Deal.find(params[:lead_id])
    @deal.comment_threads.unread_by_user(current_user).each { |c| c.comment_readers.create(:user => current_user) }
    render :nothing => true
  end
end