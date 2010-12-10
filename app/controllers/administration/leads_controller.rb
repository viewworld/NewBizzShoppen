class Administration::LeadsController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:create,:new]

  def update
    update! do |success,failure|
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