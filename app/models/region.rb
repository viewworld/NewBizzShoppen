class Region < ActiveRecord::Base
  belongs_to :country

  has_many :abstract_leads
  has_many :addresses

  validates_presence_of :name

  check_associations_before_destroy :abstract_leads, :addresses

  def to_s
    name
  end
end
