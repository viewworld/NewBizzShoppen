class Region < ActiveRecord::Base
  belongs_to :country

  has_many :abstract_leads
  has_many :addresses

  validates_presence_of :name

  before_destroy :can_be_removed

  def to_s
    name
  end

  def can_be_removed
    abstract_leads.empty? and addresses.empty?
  end
end
