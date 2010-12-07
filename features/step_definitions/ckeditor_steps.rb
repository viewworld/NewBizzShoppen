Then /^I should see ckeditor on the page$/ do
  page.should have_css("table.cke_editor")
end

When /^I fill in "([^"]*)" ckeditor with "([^"]*)"$/ do |ckeditor_instance, text|
  page.execute_script "CKEDITOR.instances.#{ckeditor_instance}.insertText('#{text}')"
end

