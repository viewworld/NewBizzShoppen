class PurchaseManagers::LeadsController < PurchaseManagers::PurchaseManagerController
  inherit_resources

  set_tab "created_leads"

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @search = Lead.scoped_search(params[:search])
    @leads = @search.where(:creator_id => current_user.id).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  public

  def new
    @lead = Lead.new(:published => true)
  end

  def create
    @lead = current_user.leads.build(params[:lead])

    create! do |success, failure|
      success.html {
        unless params[:commit_continue].blank?
          redirect_to new_purchase_managers_lead_path
        else
          redirect_to purchase_managers_leads_path
        end
      }
      end
  end

  def show
    @lead = current_user.leads.find(params[:id])
  end

  def update
    update! do |success, failure|
      success.html { redirect_to purchase_managers_leads_path }
      success.js { render :nothing => true }
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])
    if @lead.destroy
      flash[:notice] = I18n.t("purchase_manager.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("purchase_manager.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to purchase_managers_leads_path
  end
end
