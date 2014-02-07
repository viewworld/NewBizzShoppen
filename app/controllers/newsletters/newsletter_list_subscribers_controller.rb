class Newsletters::NewsletterListSubscribersController < Newsletters::NewslettersController
  inherit_resources
  before_filter :fetch_object, :only => [:new, :create, :edit, :update]
  after_filter :update_subscriber, :only => [:update], :if => lambda { params[:contact] && resource.valid? && resource.subscriber.is_a?(Contact) }

  def create
    @newsletter_list_subscriber = @newsletter_list.newsletter_list_subscribers.build(params[:newsletter_list_subscriber])
    @newsletter_list_subscriber.creator = current_user
    create! do |success, failure|
      success.html { redirect_to edit_newsletters_newsletter_list_path(@newsletter_list) }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to edit_newsletters_newsletter_list_path(@newsletter_list) }
    end
  end

  protected

  def fetch_object
    @newsletter_list = NewsletterList.find(params[:newsletter_list_id])
    raise CanCan::AccessDenied unless @newsletter_list.created_or_owned_by?(current_user)
  end

  def update_subscriber
    resource.subscriber.update_attributes(params.delete(:contact))
  end
end
