class Address < ActiveRecord::Base

  belongs_to :addressable, :polymorphic => true
  belongs_to :country

  validates_presence_of :street, :zip_code, :city, :county, :country

  def to_s
    "#{street}, #{zip_code} #{city}, #{county}"
  end

end
