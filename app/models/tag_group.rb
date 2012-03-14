class TagGroup < ActiveRecord::Base
  acts_as_taggable

  acts_as_newsletter_source
end
