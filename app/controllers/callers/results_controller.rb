class Callers::ResultsController < Callers::CallerController

  inherit_resources
  set_tab "campaigns"
  before_filter :set_campaign
  before_filter :set_result_type, :only => [:edit, :update, :destroy]

  def new
    @result = Result.new(:final => params[:type].eql?("final"))
  end

  def create
    @result = Result.new(params[:result])
    @result.creator = current_user
    create! do |success, failure|
      success.html { redirect_to callers_campaign_results_path(@campaign) }
      failure.html { render 'new' }
    end
  end

  def edit
  end

  def update
    @result.attributes = params[:result]
    if @result.save
      redirect_to callers_campaign_results_path(@campaign)
    else
     render 'edit' 
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html { redirect_to callers_campaign_results_path(@campaign) }
      failure.html {}
    end
  end

  def batch_assign
    @campaign.assign_results(params[:campaign_result_ids])
    redirect_to edit_callers_campaign_path(@campaign)
  end

  protected

  def collection
    @results = Result
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_result_type
    @result = Result.find(params[:id])
  end


end
