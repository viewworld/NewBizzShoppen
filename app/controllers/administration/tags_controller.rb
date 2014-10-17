class Administration::TagsController < Administration::AdministrationController
  set_tab 'settings'
  set_subtab 'tags'

  before_filter :set_tag, only: [:show, :edit, :update, :destroy, :duplicate]

  def index
    @search = Tag.scoped_search(params[:search])
    @tags = @search.paginate(show_all: params[:show_all], page: params[:page], per_page: Tag.per_page).decorate
  end

  def edit
    @taggings = @tag.taggings.order('taggable_type').includes(:taggable)
  end

  def show
    respond_to do |format|
      format.csv { send_data render_to_string, filename: "tagged_with_#{@tag.name}.csv" }
      format.xls { send_data render_to_string, filename: "tagged_with_#{@tag.name}.xls" }
    end
  end

  def update
    if @tag.update_attributes(tag_params)
      redirect_to administration_tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to administration_tags_path
  end

  def duplicate
    notice_key = @tag.duplicate!(params[:name]) ? :notice_successful : :notice_failure
    redirect_to administration_tags_path, notice: t(notice_key, scope: 'administration.tags.duplicate.flash', name: @tag.to_s, new_name: params[:name])
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :merge_with_tags, :merge_with_cleanup, merge_with_tag_names: [])
  end
end
