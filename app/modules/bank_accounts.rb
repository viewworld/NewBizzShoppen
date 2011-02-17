module BankAccounts

  def self.included(base)
    base.class_eval do
      before_create :set_bank_account
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    private
    def set_bank_account
      self.bank_account_id = if user_country and country_default = user_country.default_bank_account
        country_default.id
      elsif global_default = BankAccount.global_default_bank_account.first
        global_default.id
      end
    end
  end

end