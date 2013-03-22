class Suppliers::NewsletterSynchronizationsController < Suppliers::AdvancedSupplierController
  before_filter :fetch_newsletter_list

  private

  def fetch_newsletter_list
    @newsletter_list = NewsletterList.find(params[:newsletter_list_id])
  end

  public

  def create
    @newsletter_list.newsletter_synches.create(:use_delayed_job => true, :notificable => current_user)
    flash[:notice] = I18n.t("newsletters.newsletter_lists.index.view.synchronization_scheduled")
    redirect_to :back
  end
end