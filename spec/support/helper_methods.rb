def login_user(user = User.make)
  controller.stub!(:current_user).and_return(user)
  controller.stub!(:authenticate_user!).and_return(true)
  user
end