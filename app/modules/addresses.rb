module Addresses

  def self.included(base)
    base.class_eval do
      before_create :set_bank_account
      has_one :address, :as => :addressable

      accepts_nested_attributes_for :address

      validates_associated :address

      after_initialize :build_address_object
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

    def build_address_object
      if new_record? and !address
        build_address
      end
    end
  end

end