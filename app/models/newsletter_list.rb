class NewsletterList < ActiveRecord::Base
  has_many :newsletter_sources
  has_many :newsletter_subscribers, :through => :newsletter_sources
end
