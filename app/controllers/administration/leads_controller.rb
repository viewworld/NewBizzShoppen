class Administration::LeadsController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:create,:new]

  set_tab "leads"
  
  def update
    @lead = Lead.find(params[:id])
    @lead.current_user = current_user
    update! do |success,failure|
      success.html {
        redirect_to administration_leads_path
      }
      success.js {
        render :nothing => true
      }
      failure.js {
        render :update do |page|
          page << "alert('#{t("administration.leads.index.ajax.not_updated")}')"
        end
      }
    end
  end

  protected

  def collection
    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
    end
end