class LeadTemplateValue < ActiveRecord::Base
  belongs_to :lead_template_field
  belongs_to :lead
  has_many :lead_template_value_translations, :dependent => :destroy

  accepts_nested_attributes_for :lead_template_value_translations, :allow_destroy => true,
                                :reject_if => proc { |attrs| attrs['value'].blank? }


  validates_presence_of :value, :if => Proc.new { |ltv| ltv.lead_template_field.is_mandatory }
  translates :value

  accepts_nested_attributes_for :lead_template_value_translations

  before_create :duplicate_field_type

  amoeba do
    enable
  end

  def duplicate_field_type
    self.field_type = lead_template_field.field_type
  end

  def all_lead_template_value_translations(current_locale_code)
    ::Locale.enabled.select { |l| l.code != current_locale_code }.map do |locale|
      translation = lead_template_value_translations.detect { |vt| vt.locale == locale.code }
      translation = LeadTemplateValueTranslation.new(:locale => locale.code, :lead_template_value => self, :cached_field_type => lead_template_field.field_type) if translation.nil?
      translation
    end.flatten
  end

  def can_be_viewed_by?(user)
    lead_purchase = (user and user.has_any_role?(:lead_user, :lead_supplier, :supplier)) ? lead.lead_purchases.where("(owner_id = :user_id or assignee_id = :user_id) and accessible_from IS NOT NULL", { :user_id => user.id }).first : nil
    !lead_template_field.is_hidden or (lead_template_field.is_hidden and lead_purchase)
  end
end
