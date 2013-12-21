class NewsletterSubscriber < ActiveRecord::Base
  belongs_to :subscriber, :polymorphic => true

  alias_attribute :contact_name, :name
  alias_attribute :phone_number, :phone
end
