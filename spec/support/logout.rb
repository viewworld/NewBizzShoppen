def logout(redirect_path = '/')
  get '/logout'
  expect(response).to redirect_to redirect_path
  follow_redirect!
  expect(response).to be_success
  has_flash 'Signed out successfully.'
end
