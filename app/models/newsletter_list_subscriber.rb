require 'csv_exportable'

class NewsletterListSubscriber < ActiveRecord::Base
  CSV_ATTRS = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name contact_title direct_phone_number phone_number email_address linkedin_url facebook_url pnumber nnmid custom_1 custom_2 custom_3 custom_4 custom_5)
  REQUIRED_FIELDS = %w(email_address)

  include ScopedSearch::Model
  include CsvExportable

  belongs_to :newsletter_list
  belongs_to :subscriber, :polymorphic => true, :foreign_key => 'subscriber_id'
  belongs_to :creator, :polymorphic => true, :foreign_key => 'creator_id'
  belongs_to :country
  belongs_to :region
  belongs_to :newsletter_source

  validates_uniqueness_of :subscriber_id, :scope => [:newsletter_list_id, :subscriber_type], :allow_blank => true

  alias_attribute :name, :contact_name

  delegate :tag_list, :to => :taggable_subscriber

  scope :from_sources, where('subscriber_id IS NOT NULL AND subscriber_type IS NOT NULL')
  scope :for_newsletter_list, lambda { |newsletter_list| where(:newsletter_list_id => newsletter_list.id) }

  scope :with_keyword, lambda { |q| where(%{
      email_address ILIKE :keyword OR
      contact_name ILIKE :keyword OR
      company_name ILIKE :keyword
    }, {:keyword => "%#{q}%"})
  }

  def self.selected_attributes
    attrs = CSV_ATTRS.dup
    ['country', 'region'].each do |a|
      attrs[attrs.rindex(a)] = "#{a}_id"
    end
    attrs
  end

  def self.subscriber_attribute_params(object)
    params = {}
    selected_attributes.map(&:to_sym).each do |attr|
      params[attr] = object.send(attr)
    end
    params
  end

  def newsletter_source_as_text
    newsletter_source.sourceable_as_text if newsletter_source
  end

  def taggable_subscriber
    @_subscriber ||= if subscriber.is_a?(User)
      subscriber.with_role
    else
      subscriber
    end
  end

  def tag_list=(tags)
    taggable_subscriber.tag_list << tags
    taggable_subscriber.save
  end
end
