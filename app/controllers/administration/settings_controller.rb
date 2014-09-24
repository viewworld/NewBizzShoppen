class Administration::SettingsController < Administration::AdministrationController
  set_tab 'settings'
  set_subtab 'global'

  def edit
    @settings = Settings.order('var ASC')
    @bank_accounts = BankAccount.order('id ASC')
    @vat_rates = VatRate.all
    @youtube_introductions = YoutubeIntroduction.all
  end

  def update
    @settings = Settings.where({})

    params[:settings].each_pair do |id, value|
      @settings.detect { |s| s.id ==  id.to_i}.update_attribute(:value, value)
    end

    redirect_to edit_administration_setting_path, notice: t('administration.settings.update.controller.successful_update_notice')
  end
end
