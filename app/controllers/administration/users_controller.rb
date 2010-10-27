class Administration::UsersController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:create, :update]

  def new
    @user = "User::#{params[:role].to_s.camelize}".constantize.new
  end

  def create
    @user = "User::#{params[:role].to_s.camelize}".constantize.new
    @user.send(:attributes=, params["user_#{params[:role].to_s}".to_sym], false)

    if @user.save
      flash[:notice] = t("administration.users.create.flash.user_creation_successful")
      redirect_to administration_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = "User::#{User.find(params[:id]).role.to_s.camelize}".constantize.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).send(:casted_class).find(params[:id])

    @user.send(:attributes=, params["user_#{@user.role.to_s}"], false)

    if @user.save
      redirect_to administration_users_path
    else
      render :action => 'edit'
    end
  end


  protected

  def collection
    @search = User.scoped_search(params[:search])
    @users = @search.paginate(:page => params[:page])
  end

end