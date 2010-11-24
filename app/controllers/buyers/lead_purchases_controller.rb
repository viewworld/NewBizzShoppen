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
    @possible_assignees = current_user.subaccounts_and_me
    params[:search]||={}
    params[:search][:with_leads] = "1"
    params[:search][:with_owner] = current_user.id
    params[:search][:accessible] = true
    @lead_purchases = LeadPurchase.with_owner(current_user.id).accessible
    @countries = @lead_purchases.map(&:country).uniq.map{|c| [c.name, c.id]}
    @categories = @lead_purchases.map(&:category).uniq.map{|c| [c.name, c.id]}
    @assignees = @lead_purchases.map(&:assignee).uniq.compact.map{|c| [c.screen_name, c.id]}
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
