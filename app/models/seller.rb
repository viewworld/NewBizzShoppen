class Seller < ActiveRecord::Base

  include Addresses

  belongs_to :country

  has_many :invoices

  validates_presence_of :name, :company_name, :address, :first_name, :last_name, :vat_no

  before_save :assure_default
  after_save :change_default
  before_destroy :assure_at_least_one

  scope :default_seller, where(:default => true)
  scope :for_country, lambda { |country_id| joins(:address).where(:addresses => {:country_id => country_id}) }

  alias_attribute :name, :company_name

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

  def assure_at_least_one
    unless Seller.count > 1
      self.errors.add(:base, I18n.t("activerecord.errors.models.seller.must_be_at_least_one"))
      false
    end
  end

  public

  def self.default
    default_seller.first || first
  end

  def self.default_for_country(country_id)
    for_country(country_id.to_i).first || default
  end

end
