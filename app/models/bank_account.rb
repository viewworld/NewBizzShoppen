class BankAccount < ActiveRecord::Base

  include ScopedSearch::Model

  belongs_to :country

  validates_presence_of :country, :bank_name, :bank_address, :iban_no, :local_bank_number, :swift

  before_save :assure_global_default
  after_save :change_default_country_bank, :change_default_global_bank

  scope :global_default_bank_account, where(:global_default => true)
  scope :country_default_bank_account, lambda{|country_id| where(:country_id => country_id, :country_default => true)}

  scoped_order :id, :country_id

  private

  def assure_global_default
    if !global_default and global_default_changed? and (BankAccount.global_default_bank_account.size.eql?(1) and BankAccount.global_default_bank_account.first.eql?(self))
      self.errors.add(:global_default, :cannot_be_disabled)
      false
    end
  end

  def change_default_country_bank
    if country_default?
      BankAccount.country_default_bank_account(country.id).each do |ba|
        ba.update_attribute(:country_default, false) unless ba.eql?(self)
      end
    end
  end

  def change_default_global_bank
    if global_default?
      BankAccount.global_default_bank_account.each do |ba|
        ba.update_attribute(:global_default, false) unless ba.eql?(self)
      end
    end
  end

  public

  def to_s
    "#{country.name} / #{bank_name}"
  end

end
