class Callers::ResultsController < Callers::CallerController

  inherit_resources
  set_tab "campaigns"
  before_filter :set_campaign
  before_filter :set_result_type, :only => [:edit, :update, :destroy]
  before_filter lambda {authorize_role(:call_centre, :admin)}
  before_filter lambda {authorize_manage_rights(@result)}, :only => [:edit,:update,:destroy]

  def new
    @result = Result.new(:final => params[:type].eql?("final"))
    @result.result_fields.build(:name => 'Call back', :field_type => 4) unless @result.final?
  end

  def create
    @result = Result.new(params[:result])
    @result.creator = current_user
    create! do |success, failure|
      success.html {
        @result.assign_to_campaign_if_local(@campaign)
        redirect_to callers_campaign_results_path(@campaign)
      }
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
    if @result.destroy
      flash[:notice] = "Result was successfully deleted."
    else
      flash[:alert] = "Result could not be deleted because there are call results linked to it."
    end
    redirect_to callers_campaign_results_path(@campaign)
  end

  def batch_assign
    @campaign.assign_results(params)
    redirect_to edit_callers_campaign_path(@campaign)
  end

  protected

  def collection
    @results = Result.not_archived_or_assigned_to_campaign(@campaign)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_result_type
    @result = Result.find(params[:id])
  end


end
