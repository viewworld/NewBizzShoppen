module MaterialActions

  public

  def index
    @materials = @resource.materials.all
    @material = @resource.materials.build
    respond_to do |wants|
      wants.html
      wants.js {
        render :partial => 'materials', :locals => {:materials => @materials, :material => @material, :result_field_id => params[:result_field_id]}
      }
    end
  end

  def create
    @materials = @resource.materials.all
    @material = @resource.materials.build(params[:material])
    respond_to do |wants|
      if @material.save
        wants.html { redirect_to :action => :index }
        wants.js
      else
        wants.html { render :action => :index }
        wants.js
      end
    end
  end

  def update
    @material = @resource.materials.find(params[:id])
    @material.update_attributes(params[:material])
    respond_to do |wants|
      wants.js { render :nothing => true }
    end
  end

  def destroy
    @material = @resource.materials.find(params[:id])
    if @material.destroy
      flash[:notice] = I18n.t("materials.views.index.successfully_deleted")
    else
      flash[:alert] = @material.errors.full_messages
    end
    @resource.reload

    respond_to do |wants|
      wants.html { redirect_to :back }
      wants.js
    end
  end

end