require "vendor/plugins/e_template/app/models/email_template.rb"
class EmailTemplate < ActiveRecord::Base
  translates :subject, :body
  has_many :email_template_translations
  belongs_to :resource, :polymorphic => true

  scope :global, where("resource_type IS NULL and resource_id IS NULL")

  def can_be_managed_by?(user)
    user.admin? or (user.call_centre? and (resource.creator == user or resource.users.include?(user)))
  end

  private

  #Template cannot be cached due to dynamic translations
  def template
    Liquid::Template.parse body
  end
end
