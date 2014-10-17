class Administration::LeadsController < Administration::AdministrationController
  set_tab 'leads'
  
  before_filter :set_lead, only: [:edit, :update]

  def index
    params[:search] ||= { descend_by_created_at: true }

    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(show_all: params[:show_all], page: params[:page], per_page: Settings.default_leads_per_page)
  end

  def update
    @lead.current_user = current_user

    if @lead.update_attributes(params[:lead])
      redirect_to administration_leads_path
    else
      render :edit
    end
  end

  private
  def set_lead
    @lead = Lead.find(params[:id]).decorate
  end
end
