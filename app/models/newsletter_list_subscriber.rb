class NewsletterListSubscriber < ActiveRecord::Base
  CSV_ATTRS = %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name contact_title direct_phone_number phone_number email_address linkedin_url facebook_url)
  REQUIRED_FIELDS = %w(email_address)

  belongs_to :newsletter_list
  belongs_to :subscriber, :polymorphic => true, :foreign_key => 'subscriber_id'
  belongs_to :creator, :polymorphic => true, :foreign_key => 'creator_id'
  belongs_to :country
  belongs_to :region

  validates :email_address, :presence => true
  validates_uniqueness_of :email_address, :scope => :newsletter_list_id
  validates_uniqueness_of :subscriber_id, :scope => [:newsletter_list_id, :subscriber_type], :allow_blank => true

  RESTRICTED_ATTRS = %w(id created_at updated_at login_key creator_id creator_type subscriber_id subscriber_type newsletter_source_id newsletter_list_id)

  alias_attribute :name, :contact_name

  scope :from_sources, where('subscriber_id IS NOT NULL AND subscriber_type IS NOT NULL')
end
