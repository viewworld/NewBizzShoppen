class Translation < ActiveRecord::Base
  validates_uniqueness_of :key, :scope => :locale
  validates_presence_of :locale, :key

  include ScopedSearch::Model

  scope :with_keyword, lambda{|keyword| where("LOWER(key) LIKE :keyword", {:keyword => "%#{keyword.downcase}%"})}
end
