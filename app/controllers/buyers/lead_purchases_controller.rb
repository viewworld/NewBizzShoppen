class Buyers::LeadPurchasesController < Buyers::BuyerController
  inherit_resources
  respond_to :html
  respond_to :csv, :only => :show
  set_tab "owned_leads"

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @subaccounts = current_user.subaccounts
    params[:search]||={}
    params[:search][:with_leads] = "1"
    params[:search][:with_owner] = current_user.id
    params[:search][:accessible] = true
    @countries = Country.with_lead_purchase_owner(current_user).map{|c| [c.name, c.id]}
    @categories = Category.with_lead_purchase_owner(current_user).map{|c| [c.name, c.id]}
    @assignees = User.assignees_for_lead_purchase_owner(current_user).map{|c| [c.screen_name, c.id]}
    @search = LeadPurchase.scoped_search(params[:search])
    @lead_purchases = @search.paginate(:page => params[:page], :per_page => LeadPurchase.per_page)
  end

  public

  def show
    super do |format|
      format.csv { send_data @lead_purchase.to_csv, :filename => "lead-#{@lead_purchase.lead.header.parameterize}.csv" }
      format.print {
        @print = @lead_purchase
        render :file => "/printouts/index.html.erb"
      }
    end
  end

  def update

    update! do |success, _|
      success.html { redirect_to buyers_lead_purchases_path }
      success.js { render :nothing => true }
    end
  end


end
