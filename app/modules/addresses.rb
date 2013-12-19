module Addresses

  def self.included(base)
    base.class_eval do
      has_one :address, :as => :addressable, :autosave => true

      delegate :zip_code, :address_line_1, :address_line_2, :address_line_3, :region_id, :country_id, :to => :address

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
        build_address(:country => Country.get_country_from_locale)
      end
    end
  end

end
