class RemoteDealRequestsController < SecuredController
  before_filter :check_role

  def index
    @subscription_plan = SubscriptionPlan.find_by_id(params[:subscription_plan_id])
    @deals = Deal.without_inactive.without_vouchers

    unless @subscription_plan.premium_deals?
      @deals = @deals.without_premium_deals
    end

    respond_to do |format|
      format.js { }
    end
  end

  def new
    @user = User::Member.find(params[:user_id])
    @deals = Deal.without_inactive.without_vouchers

    unless @user.active_subscription.premium_deals?
      @deals = @deals.without_premium_deals
    end

    @deals = @deals.where(:id => params[:requested_deal_ids])

    @nested_lead = NestedLead.new
    @deals.each do |deal|
      lead = Lead.new
      lead.based_on_deal(deal, @user)
      @nested_lead.leads << lead
    end

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def create
    @nested_lead = NestedLead.new(params)
    @user = @nested_lead.user

    respond_to do |format|
      if @nested_lead.save
        format.html { redirect_to root_path }
      else
        format.html { render 'new' }
        format.js { }
      end
    end
  end

  protected

  def check_role
    raise CanCan::AccessDenied unless user_signed_in? and current_user.has_any_role?(:call_centre, :call_centre_agent, :agent)
  end
end