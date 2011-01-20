class BankAccount < ActiveRecord::Base

  belongs_to :country

  validates_presence_of :country, :bank_name, :bank_address, :iban_no, :local_bank_number, :swift

  before_save :change_default_bank

  private

  def change_default_bank
    if default_bank_changed? and default_bank? and bank = BankAccount.where(:country_id => country_id).first
      bank.update_attribute(:default_bank, false)
    end
  end

  public

end
