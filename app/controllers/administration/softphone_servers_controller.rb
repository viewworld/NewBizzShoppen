class Administration::SoftphoneServersController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:show]

  set_tab 'settings'
  set_subtab 'softphone_servers'

  public

  def create
    create! do |success,failure|
      success.html { redirect_to administration_softphone_servers_path }
      failure.html { render :action => :new }
    end
  end

  def update
    update! do |success,failure|
      success.html { redirect_to administration_softphone_servers_path }
      failure.html { render :action => :edit }
    end
  end

  def destroy
    destroy! do |success,failure|
      success.html { redirect_to administration_softphone_servers_path }
      failure.html {
        flash[:alert] = @softphone_server.errors[:base].join('<br/>')
        redirect_to administration_softphone_servers_path
      }
    end
  end
end
