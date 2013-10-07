class Newsletters::NewsletterSynchronizationsController < Newsletters::NewslettersController
  before_filter :fetch_newsletter_list

  private

  def fetch_newsletter_list
    @newsletter_list = NewsletterList.find(params[:newsletter_list_id])
  end

  public

  def create
    sources_synch = params[:sources_synch].to_i == 1
    campaign_monitor_synch = params[:campaign_monitor_synch].to_i == 1
    @newsletter_list.synchronize!(:notificable => current_user, :sources_synch => sources_synch, :campaign_monitor_synch => campaign_monitor_synch)
    flash[:notice] = I18n.t("newsletters.newsletter_lists.index.view.synchronization_scheduled")
    redirect_to :back
  end
end