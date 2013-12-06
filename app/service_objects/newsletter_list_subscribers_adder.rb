class NewsletterListSubscribersAdder

  attr_accessor :current_user,
                :params,
                :newsletter_list

  attr_reader :notice,
              :alert

  def initialize(current_user, params)
    self.current_user = current_user
    self.params = params

    process
  end

  public

  def ok?
    alert.blank?
  end

  private

  def process
    self.newsletter_list = current_user.admin? ? NewsletterList.find(params[:newsletter_list_id]) : NewsletterList.created_or_owned_by(current_user).find(params[:newsletter_list_id])

    if ParamsUtils.boolean?(params[:bulk_add_from_result])
      result = Result.find(params[:result_id])
      contacts = result.contacts.where(:campaign_id => params[:campaign_id])
      new_subscribers = newsletter_list.add_to_subscribers!(contacts, current_user)
      @notice = I18n.t('contacts.batch_add_to_newsletter_list.flash.added_successfully', :newsletter_list => newsletter_list.name, :contacts_count => new_subscribers)

    elsif params[:contact_ids].present?
      ids = ParamsUtils.split_by_commas(params[:contact_ids])
      contacts = Contact.where(:id => ids)
      new_subscribers = newsletter_list.add_to_subscribers!(contacts, current_user)
      @notice = I18n.t('contacts.batch_add_to_newsletter_list.flash.added_successfully', :newsletter_list => newsletter_list.name, :contacts_count => new_subscribers)

    else
      @alert = I18n.t('contacts.batch_remove.flash.no_contacts_selected')
    end
  end

end
