module User::RegistrationValidations
  def self.included(base)
    base.class_eval do
      validate :validate_if_agreement_read, :on => :create
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    private
    def validate_if_agreement_read
      if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(agreement_read) == false
        self.errors.add(:agreement_read, I18n.t("models.user.agreement_read_validation_message"))
      end
    end
  end
end