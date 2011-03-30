class Translation < ActiveRecord::Base
  validates_uniqueness_of :key, :scope => :locale
end
