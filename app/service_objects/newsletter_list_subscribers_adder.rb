class NewsletterListSubscribersAdder

  attr_reader :current_user,
              :params,
              :newsletter_list,
              :contacts_count

  private :current_user,
          :params,
          :newsletter_list

  delegate :name, :to => :newsletter_list

  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def save
    @newsletter_list = current_user.admin? ? NewsletterList.find(params[:newsletter_list_id]) : NewsletterList.created_or_owned_by(current_user).find(params[:newsletter_list_id])

    if bulk_add? || params[:contact_ids].present?
      @contacts_count = newsletter_list.add_to_subscribers!(contacts, current_user)
      return true
    end

    false
  end

  private

  def contacts
    if bulk_add?
      Result.find(params[:result_id]).contacts.where(:campaign_id => params[:campaign_id])
    else
      Contact.where(:id => params[:contact_ids].gsub(/^,/, '').split(','))
    end
  end

  def bulk_add?
    params[:bulk_add_from_result] == '1'
  end

end
