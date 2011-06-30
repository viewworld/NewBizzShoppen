class Callers::AdvancedImportController < SecuredController

  before_filter :set_campaign

  def new

  end

  def browse

  end

  def create

  end

  def destroy

  end

  private

    def set_campaign
    params[:id] = params[:campaign_id] if params[:id].blank?
    @campaign = Campaign.find(params[:id])
  end


end