class Administration::SettingsController < Administration::AdministrationController

  set_tab "settings"

  def edit
    @settings = Settings.where({})
    @bank_accounts = BankAccount.joins(:country).order("countries.name ASC, bank_name ASC")
  end

  def update
    @settings = Settings.where({})

    params[:settings].each_pair do |id, value|
      @settings.detect { |s| s.id ==  id.to_i}.update_attribute(:value, value)
    end

    flash[:notice] = I18n.t("administration.settings.update.controller.successful_update_notice")
    redirect_to edit_administration_setting_path
  end
end
