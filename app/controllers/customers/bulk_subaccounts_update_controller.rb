class Customers::BulkSubaccountsUpdateController < Customers::CustomerController
  def update
    User::Abstract.where({:parent_id => current_user.id}).where("id in (?)", params[:user_ids]).each do |user|
      user.locked = params[:locked]
      user.save
    end
    flash[:notice] = I18n.t("flash.bulk_subaccounts_update.update.notice")
    redirect_to customers_subaccounts_path
  end
end