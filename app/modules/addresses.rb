module Addresses

  def self.included(base)
    base.class_eval do
      has_one :address, :as => :addressable

      accepts_nested_attributes_for :address

      validates_associated :address

      after_initialize :build_address_object
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    private
    def build_address_object
      if new_record? and !address
        build_address(:country => Country.where(:locale => I18n.locale).first)
      end
    end
  end

end