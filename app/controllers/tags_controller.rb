class TagsController < SecuredController

  def index
    @tags =  ActsAsTaggableOn::Tag.where("lower(name) like ?", "%#{params[:term].to_s.downcase}%").to_a

    respond_to do |format|
      format.js
    end
  end

  def create
    @tags = ActsAsTaggableOn::Tag.find_or_create(params[:selected_tag_names])

    params[:taggable_class_name].constantize.where(:id => params[:taggable_ids]).each do |taggable_object|
      @tags.each do |tag|
        taggable_object.tag_list << tag.name
        taggable_object.save
      end
    end

    redirect_to :back
  end
end