class Administration::SharedSoftphonesController < Administration::AdministrationController
  inherit_resources
  defaults :resource_class => Softphone
  actions :all, :except => [:show]

  set_tab 'settings'
  set_subtab 'shared_softphones'

  def create
    create! do |success,failure|
      success.html { redirect_to administration_softphone_servers_path }
      failure.html { render :new }
    end
  end

  def update
    update! do |success,failure|
      success.html { redirect_to administration_shared_softphones_path }
      failure.html { render :edit }
    end
  end

  def destroy
    destroy! do |success,failure|
      success.html { redirect_to administration_shared_softphones_path }
      failure.html do
        flash[:alert] = @softphone_server.errors[:base].to_sentence
        redirect_to administration_softphone_servers_path
      end
    end
  end
end
