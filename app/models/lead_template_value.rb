class LeadTemplateValue < ActiveRecord::Base
  belongs_to :lead_template_field
  belongs_to :lead
  has_many :lead_template_value_translations, :dependent => :destroy

  accepts_nested_attributes_for :lead_template_value_translations, :allow_destroy => true,
                                :reject_if => proc { |attrs| attrs['value'].blank? }


  validates_presence_of :value, :if => Proc.new { |ltv| ltv.lead_template_field.lead_template.is_mandatory }
  translates :value

  before_create :duplicate_field_type

  def duplicate_field_type
    self.field_type = lead_template_field.field_type
  end

  def all_lead_template_value_translations(current_locale_code)
    Locale.all.select { |l| l.code != current_locale_code }.map do |locale|
      translation = lead_template_value_translations.detect { |vt| vt.locale == locale.code }
      translation = LeadTemplateValueTranslation.new(:locale => locale.code, :lead_template_value => self) if translation.nil?
      translation
    end.flatten
  end
end
