class Api::CampaignsController < Api::ApiController
  before_filter :fetch_campaign

  def contact
    params.merge!(:creator => current_user, :creator_name => current_user.full_name, :category_id => @campaign.category_id)
    params[:contact_name] ||= ''
    params[:email_address] ||= ''
    if @contact = @campaign.contacts.build(params) and @contact.save
      render :text => 'Contact created'
    else
      render :text => @contact.errors.full_messages.join(', '), :status => 400
    end
  end

  private

  def fetch_campaign
    if @campaign = Campaign.find_by_id(params.delete(:id)) and @campaign.can_be_accessed_by?(current_user)
      _attributes = Contact::CSV_ATTRS + ['country_id']
      params.keys.each{ |key| params.delete(key) unless _attributes.include?(key.to_s) }
    else
      render :text => 'Invalid campaign', :status => 403
    end
  end
end