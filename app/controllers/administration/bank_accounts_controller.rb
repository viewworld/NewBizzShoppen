class Administration::BankAccountsController < Administration::AdministrationController
  inherit_resources

  set_tab "settings"

  def update
    update! do |success,failure|
      success.html { redirect_to edit_administration_setting_path}
      failure.html { render :action => :edit }
    end
  end

  def create
    create! do |success,failure|
      success.html { redirect_to edit_administration_setting_path}
      failure.html { render :action => :new }
    end
  end

  def destroy
    destroy! do |format|
      format.html { redirect_to edit_administration_setting_path }
    end
  end

end