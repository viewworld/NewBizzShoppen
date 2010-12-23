module User::CommonAgent
  def self.included(base)
    base.class_eval do
      include User::RegistrationValidations

      has_many :leads,
               :as => :creator,
               :dependent => :destroy

      validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")
      validate :payout_information_is_complete

      before_validation :set_default_payout

      after_update :update_leads_creator_name_cache
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    BLACK_LISTED_ATTRIBUTES = [:paypal_email, :bank_swift_number, :bank_iban_number]

    private

    def mass_assignment_authorizer
      if self.can_edit_payout_information
        self.class.protected_attributes.reject! { |a| BLACK_LISTED_ATTRIBUTES.include?(a.to_sym)  }
        self.class.protected_attributes
      else
        super
      end
    end

    def update_leads_creator_name_cache
      if changed.any? { |attr| ["last_name", "first_name"].include?(attr) }
        Lead.update_all({:creator_name => name}, {:id => lead_ids})
      end
    end

    def set_default_payout
      self.payout = 0 if payout.blank?
    end

    def payout_information_is_complete
      if paypal_email.present? and bank_swift_number.present? and bank_iban_number.present?
        errors.add(:paypal_email, :invalid)
      elsif paypal_email.blank? and ((bank_swift_number.present? and bank_iban_number.blank?) or (bank_swift_number.blank? and bank_iban_number.present?))
        errors.add(:bank_swift_number, :blank) if bank_swift_number.blank?
        errors.add(:bank_iban_number, :blank) if bank_iban_number.blank?
      end
    end

    public

    def name
      full_name
    end

    alias_method :to_s, :name
  end
end