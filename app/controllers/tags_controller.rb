class TagsController < SecuredController
  before_filter :authorize_for_controller!

  def index
    @tags =  ActsAsTaggableOn::Tag.where("lower(name) like ?", "%#{params[:term].to_s.downcase}%").to_a

    respond_to do |format|
      format.js
    end
  end

  def create
    @tags = ActsAsTaggableOn::Tag.find_or_create(Array(params[:selected_tag_names]))

    params[:taggable_class_name].constantize.where(:id => params[:taggable_ids]).each do |taggable_object|
      taggable_object = taggable_object.with_role if taggable_object.is_a?(User)
      @tags.each do |tag|
        taggable_object.tag_list << tag.name
        taggable_object.save(:validate => false)
      end
    end

    flash[:notice] = I18n.t("tags.create.flash.tags_successfully_assigned", :tags_count => @tags.count, :taggables_count => params[:taggable_ids].to_a.size)
    redirect_to :back
  end

  def authorize_for_controller!
    authorize_role(:admin, :agent, :call_centre, :call_centre_agent)
  end
end