class Administration::SharedSoftphonesController < Administration::AdministrationController
  set_tab 'settings'
  set_subtab 'shared_softphones'

  before_filter :set_softphone, only: [:edit, :update, :destroy]

  def index
    @shared_softphones ||= Softphone.shared
  end

  def new
    @softphone = Softphone.new
  end

  def create
    @softphone = Softphone.new(softphone_params)

    if @softphone.save
      redirect_to administration_shared_softphones_path
    else
      render :new
    end
  end

  def update
    if @softphone.update_attributes(softphone_params)
      redirect_to administration_shared_softphones_path
    else
      render :edit
    end
  end

  def destroy
    @softphone.destroy

    redirect_to administration_shared_softphones_path
  end

  private
  def set_softphone
    @softphone = Softphone.find(params[:id])
  end

  def softphone_params
    params.require(:softphone).permit(:name, :sip_username, :sip_password, :softphone_server_id)
  end
end
