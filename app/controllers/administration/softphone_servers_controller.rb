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
    @softphone_server = SoftphoneServer.new(softphone_server_params)

    if @softphone_server.save
      redirect_to administration_softphone_servers_path, notice: t("flash.actions.create.notice", resource_name: 'Softphone Server')
    else
      render :new
    end
  end

  def update
    if @softphone_server.update_attributes(softphone_server_params)
      redirect_to administration_softphone_servers_path, notice: t("flash.actions.update.notice", resource_name: 'Softphone Server')
    else
      render :edit
    end
  end

  def destroy
    if @softphone_server.destroy
      redirect_to administration_softphone_servers_path, notice: t("flash.actions.destroy.notice", resource_name: 'Softphone Server')
    else
      redirect_to administration_softphone_servers_path, alert: @softphone_server.errors[:base].join('<br/>')
    end
  end

  private
  def set_softphone_server
    @softphone_server = SoftphoneServer.find(params[:id])
  end

  def softphone_server_params
    params.require(:softphone_server).permit(:name, :server_host, :server_port, :sip_domain, :sip_port)
  end
end
