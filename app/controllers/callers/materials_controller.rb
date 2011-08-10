class Callers::MaterialsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  layout proc{ |c| c.request.xhr? ? "send_material" : site_layout }

  before_filter :fetch_campaign
  before_filter lambda {authorize_access_rights(@campaign)}

  private

  def fetch_campaign
    @campaign = Campaign.available_for_user(current_user).find(params[:campaign_id])
  end

  public

  def index
    @materials = @campaign.materials.all
    @material = @campaign.materials.build
    respond_to do |wants|
      wants.html
      wants.js {
        render :partial => 'materials', :locals => {:materials => @materials, :material => @material, :result_field_id => params[:result_field_id]}
      }
    end
  end

  def create
    @materials = @campaign.materials.all
    @material = @campaign.materials.build(params[:material])
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
    @material = @campaign.materials.find(params[:id])
    @material.update_attributes(params[:material])
    respond_to do |wants|
      wants.js { render :nothing => true }
    end
  end

  def destroy
    @material = @campaign.materials.find(params[:id])
    unless @material.destroy
      flash[:alert] = @material.errors.full_messages
    else
      flash[:notice] = I18n.t("materials.views.index.successfully_deleted")
    end
    redirect_to callers_campaign_materials_path(@campaign)
  end
end