class Seller < ActiveRecord::Base

  belongs_to :country
  has_many :invoices

  validates_presence_of :name, :address, :first_name, :last_name, :vat_no, :country

  before_save :assure_default
  after_save :change_default

  scope :default_seller, where(:default => true)

  private

  def assure_default
    if !default and default_changed? and (Seller.default_seller.size.eql?(1) and Seller.default_seller.first.eql?(self))
      self.errors.add(:default, :cannot_be_disabled)
      false
    end
  end

  def change_default
    if default? and default_changed?
      Seller.default_seller.each do |s|
        s.update_attribute(:default, false) unless s.eql?(self)
      end
    end
  end

  public

end
