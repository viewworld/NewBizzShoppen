class Translation < ActiveRecord::Base
  validates_uniqueness_of :key, :scope => :locale
  validates_presence_of :locale, :key
end
