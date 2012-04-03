class Administration::TagsController < Administration::AdministrationController
  inherit_resources
  set_tab "settings"
  set_subtab "tags"

  def edit
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def update
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    update! do |success, failure|
      success.html { redirect_to administration_tags_path }
      failure.html { render 'edit' }
    end
  end

  def duplicate
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    if @tag.duplicate!(params[:name])
      flash[:notice] = I18n.t("administration.tags.duplicate.flash.notice_successful", :name => @tag.to_s, :new_name => params[:name])
    else
      flash[:notice] = I18n.t("administration.tags.duplicate.flash.notice_failure", :name => @tag.to_s, :new_name => params[:name])
    end
    respond_to do |format|
      format.html { redirect_to administration_tags_path }
    end
  end

  protected

  def collection
    @search = ActsAsTaggableOn::Tag.scoped_search(params[:search])
    @tags = @search.paginate(:page => params[:page], :per_page => ActsAsTaggableOn::Tag.per_page)
  end
end