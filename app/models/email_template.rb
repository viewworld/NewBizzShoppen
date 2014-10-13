require "plugins/e_template/app/models/email_template"
class EmailTemplate < ActiveRecord::Base
  include EmailTemplateHelp

  translates :subject, :body
  has_many :email_template_translations
  belongs_to :resource, :polymorphic => true
  has_one :email_template_signature, :as => :related

  validates_uniqueness_of :uniq_id, :scope => [:resource_type,:resource_id]

  accepts_nested_attributes_for :email_template_signature, :allow_destroy => true

  attr_accessor :preview, :enable_custom_signature, :country, :custom_email_template_signature

  scope :global, where("resource_type IS NULL and resource_id IS NULL")

  amoeba do
    enable
  end

  def can_be_managed_by?(user)
    user.admin? or (user.call_centre? and (resource.creator == user or resource.users.include?(user)))
  end

  def body_sanitized
    body.gsub(/\n/,"").gsub(/\r/,"").gsub(/[']/, '\\\\\'')
  end

  def chosen_signature
    custom_email_template_signature || email_template_signature || country.try(:email_template_signature)
  end

  def signature
    chosen_signature.try(:body) || ""
  end

  def blank_template?
    uniq_id == "blank_template"
  end

  def self.duplicate(uniq_id)
    template = global.where(uniq_id: uniq_id).first
    duplicated_template = template.dup

    template.translations.each do |translation|
      duplicated_template.translations << translation.dup
    end

    duplicated_template
  end

  private

  #Template cannot be cached due to dynamic translations
  def template
    template_content = body
    template_content += signature.to_s unless preview
    Liquid::Template.parse(template_content)
  end
end
