When /^I follow translated PDF link "([^"]*)"$/ do |key|
  click_link(I18n.t(key))
  temp_pdf = Tempfile.new('pdf')
  temp_pdf << page.source
  temp_pdf.close
  temp_txt = Tempfile.new('txt')
  `pdftotext #{temp_pdf.path} #{temp_txt.path}`
  page.driver.browser.last_response.instance_variable_set('@body', File.read(temp_txt.path))
end
