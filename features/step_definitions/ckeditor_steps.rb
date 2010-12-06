Then /^I should see ckeditor on the page$/ do
  page.should have_css("table.cke_editor")
end
