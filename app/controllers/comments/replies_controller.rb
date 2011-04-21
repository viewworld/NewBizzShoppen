class Comments::RepliesController < Comments::CommentsController

  public

  def create
    attributes = params[:comment].merge(:user_id => current_user.id)
    if params[:lead_id]
      attributes.merge!({:commentable_type => 'AbstractLead', :commentable_id => params[:lead_id]})
    end
    @thread = current_user.comment_threads.new(attributes)
    if @thread.save
      if params[:lead_id]
        redirect_to comments_lead_thread_path(params[:lead_id], @thread)
      else
        redirect_to :back
      end
      flash[:notice] = I18n.t("comments.threads.create.flash.notice")
    else
      render 'new'
    end
  end

  def new
    respond_to do |wants|
      wants.js
    end
  end

end