require "vendor/plugins/e_template/app/models/email_template.rb"
class EmailTemplate < ActiveRecord::Base
  include EmailTemplateHelp

  translates :subject, :body
  has_many :email_template_translations
  belongs_to :resource, :polymorphic => true

  validates_uniqueness_of :uniq_id, :scope => [:resource_type,:resource_id]

  attr_accessor :preview

  scope :global, where("resource_type IS NULL and resource_id IS NULL")

  def can_be_managed_by?(user)
    user.admin? or (user.call_centre? and (resource.creator == user or resource.users.include?(user)))
  end

  def body_sanitized
    body.gsub(/\n/,"").gsub(/\r/,"").gsub(/[']/, '\\\\\'')
  end

  def signature
    "<table border=\"0\" cellpadding=\"4\" cellspacing=\"4\" style=\"height: 55px; width: 800px\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t\t<img alt=\"Logo Fairleads\" src=\"{{country.email_template_signature_logo_url}}\" /></td>\r\n\t\t\t<td>\r\n\t\t\t\t{{country.email_template_signature}}</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n<p>\r\n\t&nbsp;</p>\r\n"
  end

  private

  #Template cannot be cached due to dynamic translations
  def template
    template_content = body
    template_content += signature unless preview
    Liquid::Template.parse(template_content)
  end
end
