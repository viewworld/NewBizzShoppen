class Suppliers::BulkSubaccountsUpdateController < Suppliers::AdvancedSupplierController
  def update
    @users = User::Abstract.where(parent_id: current_user.id, id: params[:user_ids])

    if params[:bulk_action_type] == 'lock'
      @users.each(&:lock!)
    elsif params[:bulk_action_type] == 'unlock'
      @users.update_all(locked_at: nil)
    end

    redirect_to suppliers_subaccounts_path, notice: t('flash.bulk_subaccounts_update.update.notice')
  end
end
