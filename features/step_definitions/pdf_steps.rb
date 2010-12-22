When /^I follow translated PDF link "([^"]*)"$/ do |key|
  click_link(I18n.t(key))
  temp_pdf = Tempfile.new('pdf')
  temp_pdf << response.body
  temp_pdf.close
  temp_txt = Tempfile.new('txt')
  `pdftotext -q #{temp_pdf.path} #{temp_txt.path}`
  response.body = File.read temp_txt.path
end
