class NewsletterSubscriber < ActiveRecord::Base
  belongs_to :subscriber, :polymorphic => true

  alias_attribute :contact_name, :name
end