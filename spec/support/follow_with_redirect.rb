def follow_with_redirect(redirect_path = '/')
  expect(response).to redirect_to redirect_path
  follow_redirect!
end
