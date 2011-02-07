class Administration::BulkUsersUpdateController < Administration::AdministrationController

  def update
    if params[:user_ids]
      User::Abstract.where(:id => params[:user_ids]).each do |user|
        if params[:create_invoice] == "1" and user.big_buyer?
           Invoice.create(:user_id => user.id)
        end

        if params[:locking].present?
          user.locked = params[:locking]
          user.save
        end
      end
    end
    flash[:notice] = I18n.t("flash.bulk_users_update.update.notice")

    redirect_to administration_users_path
  end
end