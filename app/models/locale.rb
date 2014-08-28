class Locale < ActiveRecord::Base

  validates_presence_of :language, :code

  scope :enabled, where(:enabled => true)
  default_scope order("language ASC")

  def to_s
    code
  end

  def pair
    [language, code]
  end
end
