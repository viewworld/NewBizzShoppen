class BankAccount < ActiveRecord::Base

  include ScopedSearch::Model

  has_one :address, :as => :addressable

  validates_presence_of :bank_name, :iban_no, :local_bank_number, :swift, :address
  validates_associated :address

  before_save :assure_global_default
  after_save :change_default_country_bank, :change_default_global_bank
  after_initialize :build_address_object

  scope :global_default_bank_account, where(:global_default => true)
  scope :country_default_bank_account, lambda{|country_id| includes(:address).where(:addresses => {:country_id => country_id}, :country_default => true)}

  accepts_nested_attributes_for :address

  scoped_order :id, :country_id

  private

  def build_address_object
    if new_record? and !address
      build_address
    end
  end

  def assure_global_default
    if !global_default and global_default_changed? and (BankAccount.global_default_bank_account.size.eql?(1) and BankAccount.global_default_bank_account.first.eql?(self))
      self.errors.add(:global_default, :cannot_be_disabled)
      false
    end
  end

  def change_default_country_bank
    if country_default? and country_default_changed?
      BankAccount.country_default_bank_account(address.country.id).each do |ba|
        ba.update_attribute(:country_default, false) unless ba.eql?(self)
      end
    end
  end

  def change_default_global_bank
    if global_default? and global_default_changed?
      BankAccount.global_default_bank_account.each do |ba|
        ba.update_attribute(:global_default, false) unless ba.eql?(self)
      end
    end
  end

  public

  def to_s
    "#{address.country.name} / #{bank_name}"
  end

  def bank_address
    address.to_s
  end

end
