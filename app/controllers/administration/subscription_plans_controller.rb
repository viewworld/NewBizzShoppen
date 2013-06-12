class Administration::SubscriptionPlansController < Administration::AdministrationController
  inherit_resources
  set_tab "reports"
  set_subtab "subscription_plans"

  cache_sweeper :subscription_plan_sweeper

  def new
    @subscription_plan = SubscriptionPlan.new(:seller => Seller.default, :paypal_retries => 1)
  end

  def create
    create! do |success, failure|
      success.html { redirect_to administration_subscription_plans_path }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to administration_subscription_plans_path }
    end
  end
  
  def destroy
    @subscription_plan = SubscriptionPlan.find(params[:id])
    if @subscription_plan.destroy
      flash[:notice] = I18n.t("flash.subscription_plans.destroy.notice")
    else
      flash[:notice] = I18n.t("flash.subscription_plans.destroy.failure", :roles => @subscription_plan.assigned_roles.join)
    end

    redirect_to :back
  end
  
  def fetch_subscription_plans
    @subscription_plans = params[:assigned_roles].to_s == "null" ? [] :
                          SubscriptionPlan.without_paypal.for_roles(params[:assigned_roles].to_s.split(",")).where("id NOT in (?)", params[:id].to_i)
    respond_to do |format|
      format.js {  }
    end
  end  

  protected

  def collection
    params[:search] ||= {}

    @search = SubscriptionPlan.scoped_search(params[:search])
    @subscription_plans = @search.all.paginate :page => params[:page], :per_page => 20
  end
end