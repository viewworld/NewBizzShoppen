class Comments::LeadsController < Comments::CommentsController

  before_filter :fetch_lead

  set_tab "comments"

  private

  def fetch_lead
    @lead = current_user.leads.find(params[:id])
  end

  public

  def show
    @threads = @lead.comment_threads.roots.order("created_at DESC")
  end
end