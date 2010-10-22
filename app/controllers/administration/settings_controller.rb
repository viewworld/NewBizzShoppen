class Administration::SettingsController < Administration::AdministrationController

  def edit
    @settings = Settings.where({})
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
