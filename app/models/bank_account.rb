class BankAccount < ActiveRecord::Base

  belongs_to :country

  validates_presence_of :country, :bank_name, :bank_address, :iban_no, :local_bank_number, :swift

  before_save :change_default_bank

  scope :global_default_bank_account, where(:global_default => true)
  scope :country_default_bank_account, lambda{|country_id| where(:country_id => country_id, :country_default => true)}

  private

  def change_default_bank
    # country default
    if country_default? and (country_default_changed? or new_record?) and bank = BankAccount.country_default_bank_account(country.id).first
      bank.update_attribute(:country_default, false)
    end
    # global default
    if global_default? and (global_default_changed? or new_record?) and bank = BankAccount.global_default_bank_account.first
      bank.update_attribute(:global_default, false)
    end
  end

  public

#  def to_s
#    "#{country.name} / #{bank_name}"
#  end

end
