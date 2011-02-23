class Administration::CurrenciesController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:show]

  set_tab "settings"
  set_tab "currencies"

  def create
    create! do |success,failure|
      success.html { redirect_to administration_currencies_path }
      failure.html { render :action => :new }
    end
  end

  def update
    update! do |success,failure|
      success.html { redirect_to administration_currencies_path }
      failure.html { render :action => :edit }
    end
  end

  def destroy
    destroy! do |success,failure|
      success.html { redirect_to administration_currencies_path }
      failure.html {
        flash[:alert] = @currency.errors[:base].join('<br/>')
        redirect_to administration_currencies_path
      }
    end
  end

end