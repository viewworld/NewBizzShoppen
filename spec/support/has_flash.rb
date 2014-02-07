def has_flash text, type = :notice
  expect(flash[type]).to eq text
end
