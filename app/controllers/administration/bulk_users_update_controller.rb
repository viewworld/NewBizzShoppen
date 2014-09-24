class Administration::BulkUsersUpdateController < Administration::AdministrationController
  def update
    @users = User::Abstract.where(id: params[:user_ids])

    if params[:bulk_action_type] == 'create_invoice'
      bulk_create_invoices_for(@users.select(&:big_buyer?))
    elsif params[:bulk_action_type] == 'unlock'
      @users.update_all(locked_at: nil)
    elsif params[:bulk_action_type] == 'lock'
      @users.each(&:lock!)
    end

    redirect_to administration_users_path, notice: t('flash.bulk_users_update.update.notice')
  end

  private
  def bulk_create_invoices_for(users)
    ActiveRecord::Base.transaction do
      users.each do |user|
        user.lead_purchases.each do |lead_purchase|
          Invoice.create(user_id: user.id, currency_id: lead_purchase.currency_id)
        end
      end
    end
  end
end
