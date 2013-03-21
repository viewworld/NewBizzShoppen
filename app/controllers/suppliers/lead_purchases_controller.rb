class Suppliers::LeadPurchasesController < Suppliers::BasicSupplierController
  inherit_resources
  respond_to :html
  respond_to :csv, :only => :show
  set_tab "owned_leads"
  before_filter :check_access_to_lead_purchase, :only => [:show]
  before_filter :check_supplier_role
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
    @countries = Country.with_lead_purchase_owner(current_user).map{|c| [c.name.to_s, c.id]}.sort
    @categories = LeadCategory.with_lead_purchase_owner(current_user).map{|c| [c.name.to_s, c.id]}.sort
    @assignees = User.assignees_for_lead_purchase_owner(current_user).map{|c| [c.screen_name.to_s, c.id]}.sort
    @search = LeadPrimaryPurchase.scoped_search(params[:search])
    @lead_purchases = @search.order("accessible_from DESC").paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def check_access_to_lead_purchase
    @lead_purchase = current_user.accessible_lead_purchases.find_by_id(params[:id])
    if @lead_purchase.nil?
      redirect_to suppliers_lead_purchases_path
    end
  end

  def check_supplier_role
    if !current_user.has_role?(:supplier)
      redirect_to supplier_home_path
    end
  end

  public

  def show
    @lead_purchase = current_user.accessible_lead_purchases.find_by_id(params[:id])
    super do |format|
      format.csv { send_data @lead_purchase.to_csv, :filename => "lead-#{@lead_purchase.lead.header.parameterize}.csv" }
      format.xls { send_data render_to_string, :filename => "lead-#{@lead_purchase.lead.header.parameterize}.xls" }
      format.print {
        @print = @lead_purchase
        render :file => "/printouts/index.html.erb"
      }
    end
  end

  def update
    update! do |success, _|
      success.html { redirect_to suppliers_lead_purchases_path }
      success.js { render :nothing => true }
    end
  end


end
