class Newsletters::NewsletterSynchronizationsController < Newsletters::NewslettersController
  before_filter :fetch_newsletter_list

  private

  def fetch_newsletter_list
    @newsletter_list = NewsletterList.find(params[:newsletter_list_id])
  end

  public

  def create
    @newsletter_list.newsletter_synches.create(:use_delay_job => true, :notify_object => current_user)
    flash[:notice] = I18n.t("newsletters.newsletter_lists.index.view.synchronization_scheduled")
    redirect_to :back
  end
end