module User::RegularUser
  def self.included(base)
    base.class_eval do
      validates_presence_of :first_name, :last_name, :phone, :screen_name, :street, :city, :zip_code, :county, :country
      validate :validate_if_agreement_read, :on => :create
      before_create :set_role
    end

    base.send(:include, InstanceMethods)
    base.send(:extend, ClassMethods)
  end

  module InstanceMethods
    private
    def validate_if_agreement_read
      if agreement_read.to_i == 0
        self.errors.add(:agreement_read, I18n.t("models.user.agreement_read_validation_message"))
      end
    end

    def set_role
      self.roles = [self.class.const_get("ROLE")]
    end
  end

  module ClassMethods

  end
end