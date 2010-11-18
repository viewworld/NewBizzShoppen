class LeadUsers::LeadPurchasesController < LeadUsers::LeadUserController
  inherit_resources

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    params[:search]||={}
    params[:search][:with_assignee] = current_user.id
    params[:search][:with_leads] = "1"
    @lead_purchases = LeadPurchase.with_assignee(current_user.id)
    @countries = @lead_purchases.map(&:country).uniq.map{|c| [c.name, c.id]}
    @categories = @lead_purchases.map(&:category).uniq.map{|c| [c.name, c.id]}
    @search = LeadPurchase.scoped_search(params[:search])
    @lead_purchases = @search.paginate(:page => params[:page], :per_page => LeadPurchase.per_page)
  end

  public

  def update
    update! do |success, _|
      success.html { redirect_to lead_users_lead_purchases_path }
      success.js { render :nothing => true }
    end
  end
end
