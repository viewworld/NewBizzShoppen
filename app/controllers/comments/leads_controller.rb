class Comments::LeadsController < Comments::CommentsController

  def show
    @lead = current_user.leads.find(params[:id])
    @threads = @lead.comment_threads.roots
  end
end