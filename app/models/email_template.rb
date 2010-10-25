require "vendor/plugins/e_template/app/models/email_template.rb"
class EmailTemplate < ActiveRecord::Base
  translates :subject, :body
  private

  #Template cannot be cached due to dynamic translations
  def template
    Liquid::Template.parse body
  end
end
