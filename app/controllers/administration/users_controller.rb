class Administration::UsersController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [ :create, :update ]

  def new
    @user = "User::#{params[:role].to_s.camelize}".constantize.new
  end

  def create
    "User::#{params[:role].to_s.camelize}".constantize.with_accessible_attributes do |klass|
      @user = klass.new(params["user_#{params[:role].to_s}"])

      if @user.save
        flash[:notice] = "User created!"
         redirect_to administration_users_path
      else
        render :action => 'new'
      end
    end
  end

  def edit
    @user = "User::#{User.find(params[:id]).role.to_s.camelize}".constantize.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    "User::#{@user.role.to_s.camelize}".constantize.with_accessible_attributes do |klass|
      @user = klass.find(params[:id])
      if @user.update_attributes(params["user_#{@user.role.to_s}".to_sym])
        redirect_to administration_users_path
      else
        render :action => 'edit'
      end
    end
  end

  protected
    def collection
      @search = User.scoped_search(params[:search])
      @users = @search.paginate(:page => params[:page])
      #@users ||= end_of_association_chain.paginate(:page => params[:page])
    end
end