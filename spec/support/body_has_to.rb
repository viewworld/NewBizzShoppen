def body_has_to(method, *args)
  expect(response.body).to(self.send(method, *args))
end
