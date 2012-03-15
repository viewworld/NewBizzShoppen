class Administration::ChainMailTypesController < Administration::AdministrationController
  inherit_resources

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_archived] = "0" unless params[:search][:with_archived].present?
    @search = ChainMailType.scoped_search(params[:search])
    @chain_mail_types = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  public

  def update
    update! do |success, failure|
      success.html { redirect_to administration_chain_mail_types_path }
    end
  end

  def create
    create! do |success, failure|
      success.html { redirect_to administration_chain_mail_types_path }
    end
  end

end
