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

end