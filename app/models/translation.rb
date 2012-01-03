class Translation < ActiveRecord::Base
  validates_uniqueness_of :key, :scope => :locale
  validates_presence_of :locale, :key

  include ScopedSearch::Model

  scope :with_keyword, lambda{|keyword| where("LOWER(key) LIKE :keyword", {:keyword => "%#{keyword.downcase}%"})}

  def self.create_or_update!(attrs)
    if translation = Translation.where(:key => attrs[:key], :locale => attrs[:locale]).first
      translation.update_attributes(attrs)
    else
      Translation.create(attrs)
    end
  end
end
