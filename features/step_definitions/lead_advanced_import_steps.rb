Then /^lead advanced import all correct$/ do
  And %{I select "Business" from "category_id" within "#lead_advanced_import_form"}
  And %{attach the file "lead advanced import spreadsheet" to "attachment"}
  And %{I press translated "lead_advanced_import.form.view.button"}
  And %{I should see translated "lead_advanced_import.choose.view.title" with options "category:Business"}
  And %{I press translated "lead_advanced_import.choose.view.next_button"}
  And %{I should see translated "lead_advanced_import.preview.view.title" with options "category:Business"}
  And %{I follow translated "lead_advanced_import.preview.view.cancel_button"}
  And %{I should see translated "lead_advanced_import.choose.view.title" with options "category:Business"}
  And %{I press translated "lead_advanced_import.choose.view.next_button"}
  And %{I should see translated "lead_advanced_import.preview.view.title" with options "category:Business"}
  And %{I press translated "lead_advanced_import.preview.view.import_button"}
  And %{I should see "lead_template_values.value can't be blank"}
  And %{I should see "currency can't be blank"}
  And %{I should see translated "callers.advanced_import.create.flash.success" with options "counter:2 / 4"}
end


Then /^lead advanced import wrong files, fields and cancel button$/ do
  And %{I press translated "lead_advanced_import.form.view.button"}
  And %{I should see translated "callers.advanced_import.choose.flash.error_wrong_file"}
  And %{attach the file "sample image" to "attachment"}
  And %{I press translated "lead_advanced_import.form.view.button"}
  And %{I should see translated "callers.advanced_import.choose.flash.error_wrong_file"}
  And %{attach the file "bad advanced import spreadsheet" to "attachment"}
  And %{I press translated "lead_advanced_import.form.view.button"}
  And %{I should see translated "callers.advanced_import.choose.flash.error_wrong_title"}
  And %{I select "Business" from "category_id" within "#lead_advanced_import_form"}
  And %{attach the file "lead advanced import spreadsheet" to "attachment"}
  And %{I press translated "lead_advanced_import.form.view.button"}
  And %{I should see "Company name *"}
  And %{I should see "Business template => field #1 *"}
  And %{I should see "Business template => field #2"}
  And %{I should see "Value 4"}
  And %{I follow translated "lead_advanced_import.choose.view.cancel_button"}
  And %{I should see translated "lead_advanced_import.form.view.title"}
end