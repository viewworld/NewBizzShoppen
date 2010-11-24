class LeadUsers::LeadPurchasesController < LeadUsers::LeadUserController
  inherit_resources

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @subaccounts = current_user.subaccounts
    params[:search]||={}
    params[:search][:with_assignee] = current_user.id
    params[:search][:with_leads] = "1"
    @countries = Country.with_lead_purchase_assignee(current_user).map{|c| [c.name, c.id]}
    @categories = Category.with_lead_purchase_assignee(current_user).map{|c| [c.name, c.id]}
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

  def show
    super do |format|
      format.csv { send_data @lead_purchase.to_csv, :filename => "lead-#{@lead_purchase.lead.header.parameterize}.csv" }
      format.print {
        @print = @lead_purchase
        render :file => "/printouts/index.html.erb"
      }
    end
  end
end
