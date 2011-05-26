class Callers::MaterialsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  layout proc{ |c| c.request.xhr? ? "send_material" : "application" }

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
        render :partial => 'materials', :locals => {:materials => @materials, :material => @material}
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

  def destroy
  end
end