class Administration::BulkUsersUpdateController < Administration::AdministrationController
  def update
    @users = User::Abstract.where(id: params[:user_ids])

    if params[:bulk_action_type] == 'create_invoice'
      ActiveRecord::Base.transaction do
        @users.each do |user|
          if user.big_buyer?
            user.lead_purchases.each do |lead_purchase|
              Invoice.create(user_id: user.id, currency_id: lead_purchase.currency_id)
            end
          end
        end
      end
    elsif params[:bulk_action_type] == 'unlock'
      @users.update_all(locked_at: nil)
    elsif params[:bulk_action_type] == 'lock'
      @users.each(&:lock!)
    end

    redirect_to administration_users_path, notice: t('flash.bulk_users_update.update.notice')
  end
end
