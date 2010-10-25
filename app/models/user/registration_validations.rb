module User::RegistrationValidations
  def self.included(base)
    base.class_eval do
      validates_presence_of :first_name, :last_name, :phone, :street, :city, :zip_code, :county, :country
      validate :validate_if_agreement_read, :on => :create
    end

    base.send(:include, InstanceMethods)
    base.send(:extend, ClassMethods)
  end

  module InstanceMethods
    private
    def validate_if_agreement_read
      if !!agreement_read == false
        self.errors.add(:agreement_read, I18n.t("models.user.agreement_read_validation_message"))
      end
    end
  end

  module ClassMethods

  end
end