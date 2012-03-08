class Administration::ChainMailsController < Administration::AdministrationController
  inherit_resources

  def collection
    @chain_mails = ChainMail.order("name ASC").paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def update
    update! do |success, failure|
      success.html { redirect_to administration_chain_mails_path }
    end
  end

  def create
    create! do |success, failure|
      success.html { redirect_to administration_chain_mails_path }
    end
  end

end
