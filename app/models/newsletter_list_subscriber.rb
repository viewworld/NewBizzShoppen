class NewsletterListSubscriber < ActiveRecord::Base
  belongs_to :newsletter_list
  belongs_to :subscriber, :polymorphic => true, :foreign_key => 'subscriber_id'
  belongs_to :creator, :polymorphic => true, :foreign_key => 'creator_id'

  validates :email_address, :presence => true
  validates_uniqueness_of :email_address, :scope => :newsletter_list_id
  validates_uniqueness_of :subscriber_id, :scope => [:newsletter_list_id, :subscriber_type], :allow_blank => true

  RESTRICTED_ATTRS = %w(id created_at updated_at login_key creator_id creator_type subscriber_id subscriber_type newsletter_source_id newsletter_list_id)

  alias_attribute :name, :contact_name

  scope :from_sources, where('subscriber_id IS NOT NULL AND subscriber_type IS NOT NULL')
end
