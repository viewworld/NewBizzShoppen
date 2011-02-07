class Administration::SettingsController < Administration::AdministrationController

  set_tab "settings"

  def edit
    @settings = Settings.where({})
    @bank_accounts_search = BankAccount.scoped_search(params[:bank_accounts])
    @bank_accounts_search.ascend_by_country_id = true unless params[:bank_accounts]
    @bank_accounts = @bank_accounts_search.all.paginate :page => params[:page], :per_page => 20
    @vat_rates = VatRate.all
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
