class LeadUsers::LeadPurchasesController < LeadUsers::LeadUserController
  inherit_resources
  set_tab "my_assigned_leads"
  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @subaccounts = current_user.parent.nil? ? current_user.subaccounts : current_user.parent.subaccounts
    params[:search]||={}
    params[:search][:with_assignee] = current_user.id
    params[:search][:with_leads] = "1"
    @countries = Country.with_lead_purchase_assignee(current_user).map{|c| [c.name.to_s, c.id]}.sort
    @categories = LeadCategory.with_lead_purchase_assignee(current_user).map{|c| [c.name.to_s, c.id]}.sort
    @search = LeadPurchase.scoped_search(params[:search])
    @lead_purchases = @search.order("created_at DESC").paginate(:show_all => params[:show_all], :page => params[:page], :per_page => LeadPurchase.per_page)
  end

  public

  def update
    update! do |success, _|
      success.html { redirect_to lead_users_lead_purchases_path }
      success.js { render :nothing => true }
    end
  end

  def show
    @lead_purchase = current_user.accessible_lead_purchases.find(params[:id])
    super do |format|
      format.csv { send_data @lead_purchase.to_csv, :filename => "lead-#{@lead_purchase.lead.header.parameterize}.csv" }
      format.xls { send_data render_to_string, :filename => "lead-#{@lead_purchase.lead.header.parameterize}.xls" }
      format.print {
        @print = @lead_purchase
        render :file => "/printouts/index.html.erb"
      }
    end
  end
end
