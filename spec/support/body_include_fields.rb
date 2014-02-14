def body_include_fields(fields = [])
  fields.each do |field, _|
    body_has_to(:have_field, field)
  end
end
