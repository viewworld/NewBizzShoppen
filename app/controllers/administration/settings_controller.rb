class Administration::SettingsController < Administration::AdministrationController

  set_tab "settings"
  set_subtab "global"

  def edit
    @settings = Settings.order("var ASC")
    @bank_accounts_search = BankAccount.scoped_search(params[:bank_accounts])
    @bank_accounts_search.ascend_by_id = true unless params[:bank_accounts]
    @bank_accounts = @bank_accounts_search.all
    @vat_rates = VatRate.all
    @youtube_introductions = YoutubeIntroduction.all
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
