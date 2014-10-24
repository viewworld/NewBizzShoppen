class RemoveEmailTemplateSignatureFromCountries < ActiveRecord::Migration
  def up
    remove_column :countries, :email_template_signature
  end

  def down
    add_column :countries, :email_template_signature, :text
  end
end
