class Newsletters::NewsletterCampaignsController < Newsletters::NewslettersController
  inherit_resources

  skip_filter :authorize_user_for_namespace!, :only => [:show]
  skip_filter :authenticate_user!, :only => [:show]

  set_tab "campaigns"
  set_subtab "newsletter_campaigns"

  def new
    @newsletter_campaign = NewsletterCampaign.create(:skip_validations => true, :creator => current_user)
    redirect_to edit_newsletters_newsletter_campaign_path(@newsletter_campaign)
  end

  def update
    update! do |success, failure|
      success.html { redirect_to newsletters_newsletter_campaigns_path }
      failure.html { render 'edit' }
    end
  end

  def show
    @newsletter_campaign = NewsletterCampaign.where(:template_key => params[:id]).first
    render 'show', :layout => params[:txt] == "1" ? false : "newsletter_template"
  end

  def lists_for_owner
    @user = User.where(:email => params[:owner_email]).first
    @newsletter_lists = @user ? @user.newsletter_lists : []

    respond_to do |format|
      format.js
    end
  end

  def archive
    @newsletter_campaign = NewsletterCampaign.find(params[:id])
    @newsletter_campaign.archive_or_retrieve!
    if @newsletter_campaign.is_archived?
      flash[:notice] = I18n.t("newsletters.newsletter_campaigns.archive.flash.notice_archived")
    else
      flash[:notice] = I18n.t("newsletters.newsletter_campaigns.archive.flash.notice_retrieved")
    end
    redirect_to newsletters_newsletter_campaigns_path
  end

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