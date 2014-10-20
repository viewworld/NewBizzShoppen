class Administration::SoftphoneServersController < Administration::AdministrationController
  set_tab 'settings'
  set_subtab 'softphone_servers'

  before_filter :set_softphone_server, only: [:edit, :update, :destroy]

  def index
    @softphone_servers = SoftphoneServer.all
  end

  def new
    @softphone_server = SoftphoneServer.new
  end

  def create
    @softphone_server = SoftphoneServer.new(params[:softphone_server])

    if @softphone_server.save
      redirect_to administration_softphone_servers_path
    else
      render :new
    end
  end

  def update
    if @softphone_server.update_attributes(params[:softphone_server])
      redirect_to administration_softphone_servers_path
    else
      render :edit
    end
  end

  def destroy
    if @softphone_server.destroy
      redirect_to administration_softphone_servers_path
    else
      redirect_to administration_softphone_servers_path, alert: @softphone_server.errors[:base].join('<br/>')
    end
  end

  private

  def set_softphone_server
    @softphone_server = SoftphoneServer.find(params[:id])
  end
end
