class Suppliers::BulkSubaccountsUpdateController < Suppliers::SupplierController
  def update
    User::Abstract.where({:parent_id => current_user.id}).where("id in (?)", params[:user_ids]).each do |user|
      user.locked = params[:bulk_action_type]
      user.save
    end
    flash[:notice] = I18n.t("flash.bulk_subaccounts_update.update.notice")
    redirect_to suppliers_subaccounts_path
  end
end