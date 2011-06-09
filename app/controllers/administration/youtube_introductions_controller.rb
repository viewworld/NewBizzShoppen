class Administration::YoutubeIntroductionsController < Administration::AdministrationController
  inherit_resources

  set_tab "settings"
  set_subtab "global"

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
    destroy! do |success,failure|
      success.html { redirect_to edit_administration_setting_path }
      failure.html { redirect_to edit_administration_setting_path }
    end
  end

end