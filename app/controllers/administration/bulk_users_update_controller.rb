class Administration::BulkUsersUpdateController < Administration::AdministrationController

  def update
    if params[:user_ids]
      User::Abstract.where(:id => params[:user_ids]).each do |user|
        if params[:bulk_action_type] == "create_invoice" and user.big_buyer?
           Invoice.create(:user_id => user.id)
        elsif params[:bulk_action_type].to_s.include?("lock")
          user.locked = params[:bulk_action_type]
          user.save
        end
      end
    end
    flash[:notice] = I18n.t("flash.bulk_users_update.update.notice")

    redirect_to administration_users_path
  end
end