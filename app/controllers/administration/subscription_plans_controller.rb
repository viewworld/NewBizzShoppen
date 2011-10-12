class Administration::SubscriptionPlansController < Administration::AdministrationController
  inherit_resources
  set_tab "financial"
  set_subtab "subscription_plans"

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

  protected

  def collection
    params[:search] ||= {}

    @search = SubscriptionPlan.scoped_search(params[:search])
    @subscription_plans = @search.all.paginate :page => params[:page], :per_page => 20
  end
end