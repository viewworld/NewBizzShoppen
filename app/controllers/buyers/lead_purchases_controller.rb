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
    @lead_purchases ||= end_of_association_chain.paginate(:page => params[:page])
  end

  public

  def index
    @subaccounts = current_user.subaccounts
    super
  end

  def show
    super do |format|
      format.csv { send_data @lead_purchase.to_csv, :filename => "lead-#{@lead_purchase.lead.header.parameterize}.csv" }
    end
  end

  def update

    update! do |success, _|
      success.html { redirect_to buyers_lead_purchases_path }
      success.js { render :nothing => true }
    end
  end


end
