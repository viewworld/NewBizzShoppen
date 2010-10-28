class LeadUsers::LeadPurchasesController < LeadUsers::LeadUserController
  inherit_resources

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @lead_purchases ||= end_of_association_chain.paginate(:page => params[:page])
  end

  public

  def update
    update! do |success, _|
      success.html { redirect_to lead_users_lead_purchases_path }
      success.js { render :nothing => true }
    end
  end
end
