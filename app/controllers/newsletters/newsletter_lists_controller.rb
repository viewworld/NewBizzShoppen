class Newsletters::NewsletterListsController < Newsletters::NewslettersController
  inherit_resources

  set_tab "campaigns"
  set_subtab "newsletter_lists"

  def create
    create! do |success, failure|
      success.html { redirect_to newsletters_newsletter_lists_path }
      failure.html { render 'new' }
      failure.js {  }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to newsletters_newsletter_lists_path }
      failure.html { render 'new' }
    end
  end

  def sourceable_for_search
    @items = []
    @items << Campaign.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items << SubscriptionPlan.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items << LeadCategory.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items << Role.find_by_key(params[:q].downcase)
    @items << ActsAsTaggableOn::Tag.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(10)
    @items = @items.flatten

    respond_to do |format|
      format.js
    end
  end

end