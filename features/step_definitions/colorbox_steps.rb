Then /^I should see colorbox on the page$/ do
  page.should have_css("div#colorbox")
end

Then /^I should not see colorbox on the page$/ do
  page.should_not have_css("div#colorbox")
end
