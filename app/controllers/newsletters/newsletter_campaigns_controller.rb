class Newsletters::NewsletterCampaignsController < Newsletters::NewslettersController
  inherit_resources

  set_tab "campaigns"
  set_subtab "newsletter_campaigns"


  protected

  def collection
    @search = NewsletterCampaign.scoped_search(params[:search])
    @search.with_archived ||= 0
    @search.created_or_owned_by = current_user unless current_user.admin?
    @newsletter_campaigns = @search.paginate(:page => params[:page], :per_page => NewsletterCampaign.per_page)
  end

  def authorize_user_for_namespace!
    authorize_role(:admin)
  end
end