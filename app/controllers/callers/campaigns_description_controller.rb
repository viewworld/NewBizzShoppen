class Callers::CampaignsDescriptionController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  before_filter :fetch_campaign
  before_filter lambda {authorize_access_rights(@campaign)}

  def edit

  end

  def update
    respond_to do |wants|
    if @campaign.update_attributes(params[:campaign])
        wants.html { redirect_to edit_callers_campaign_path(@campaign) }
      else
        wants.html { render :action => :edit }
      end
    end
  end

  def show
    respond_to do |wants|
      wants.js
    end
  end

  private

  def fetch_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end