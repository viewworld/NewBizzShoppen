class Newsletters::TagSubscriberSourcesController < Newsletters::NewslettersController
  before_filter :get_newsletter_list

  def create
    @tagger = NewsletterListSubscriberTagger.new(newsletter_list_subscriber_tagger_params)
    @result = @tagger.save
    @tagger = NewsletterListSubscriberTagger.new if @result
  end

  private

  def newsletter_list_subscriber_tagger_params
    params[:newsletter_list_subscriber_tagger].merge({:newsletter_list => @newsletter_list})
  end

  def get_newsletter_list
    @newsletter_list = NewsletterList.find(params[:newsletter_list_id])
    raise CanCan::AccessDenied unless @newsletter_list.created_or_owned_by?(current_user)
  end
end
