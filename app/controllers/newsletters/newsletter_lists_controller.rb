class Newsletters::NewsletterListsController < Newsletters::NewslettersController
  inherit_resources
  before_filter :fetch_object, :only => [:edit, :update, :archive, :unsubscribe, :bulk_subscribers_export]

  set_tab "campaigns"
  set_subtab "newsletter_lists"

  def edit
    params[:search] ||= {}
    @search = NewsletterListSubscriber.order("contact_name").scoped_search(params[:search])
    @search.for_newsletter_list = @newsletter_list
    @newsletter_subscribers = @search.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 20)
    @newsletter_list_subscribers_count = @newsletter_list.newsletter_list_subscribers.count
    @newsletter_list_last_synchronized_at = @newsletter_list.last_synchronized_at
    @tagger = NewsletterListSubscriberTagger.new(params[:newsletter_list_subscriber_tagger])
  end

  def create
    @newsletter_list = NewsletterList.new(params[:newsletter_list])
    @newsletter_list.creator = current_user
    create! do |success, failure|
      success.html { redirect_to newsletters_newsletter_lists_path }
      failure.html { render 'new' }
      success.js { }
      failure.js { }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to newsletters_newsletter_lists_path }
      failure.html { render 'new' }
      success.js { }
      failure.js { }
    end
  end

  def archive
    @newsletter_list.archive_or_retrieve!
    if @newsletter_list.is_archived?
      flash[:notice] = I18n.t("newsletters.newsletter_lists.archive.flash.notice_archived")
    else
      flash[:notice] = I18n.t("newsletters.newsletter_lists.archive.flash.notice_retrieved")
    end
    redirect_to newsletters_newsletter_lists_path
  end

  def bulk_subscribers_export
    @newsletter_subscribers = @newsletter_list.newsletter_list_subscribers.order("contact_name")
    @newsletter_subscribers = @newsletter_subscribers.where(:id => params[:ids]) if params[:ids].present?

    respond_to do |format|
      format.csv { send_data NewsletterListSubscriber.records_to_csv(@newsletter_subscribers), :filename => "contacts.csv" }
      format.xls
    end
  end

  def unsubscribe
    @newsletter_list.send(:cm_delete!)

    flash[:notice] = I18n.t("newsletters.newsletter_lists.unsubscribe.flash.notice")
    redirect_to newsletters_newsletter_lists_path
  end

  def sourceable_for_search
    @items = []
    @items << Campaign.available_for_user(current_user).where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items << SubscriptionPlan.active.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items << LeadCategory.without_locked.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items << Role.find_by_key(params[:q].to_s.downcase.gsub(" ", "_"))
    @items << ActsAsTaggableOn::Tag.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items = @items.flatten

    respond_to do |format|
      format.js
    end
  end

  protected

  def collection
    @search = NewsletterList.scoped_search(params[:search])
    @search.with_archived ||= 0

    # FIXME: created_or_owned_by is NewsletterList function, but NewsletterList.scoped_search returns instance of
    # FIXME: ScopedSearch::Base. Do we want it to return callers' class?
    # @search.created_or_owned_by = current_user unless current_user.admin?
    @newsletter_lists = @search.order("created_at DESC").paginate(:show_all => params[:show_all], :page => params[:page], :per_page => NewsletterList.per_page)
  end

  def fetch_object
    @newsletter_list = NewsletterList.find(params[:id])
    raise CanCan::AccessDenied unless @newsletter_list.created_or_owned_by?(current_user)
  end
end
