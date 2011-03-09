class Administration::CountriesController < Administration::AdministrationController
  inherit_resources
  set_tab "settings"
  set_subtab "countries"

  def create
    create! do |success,failure|
      success.html { redirect_to administration_countries_path }
      failure.html { render :action => :new }
    end
  end

  def update
    update! do |success,failure|
      success.html { redirect_to administration_countries_path }
      failure.html { render :action => :edit }
    end
  end

  def destroy
    destroy! do |success,failure|
      success.html { redirect_to administration_countries_path }
      failure.html {
        flash[:alert] = @currency.errors[:base].join('<br/>')
        redirect_to administration_countries_path
      }
    end
  end
end