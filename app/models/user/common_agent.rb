module User::CommonAgent
  def self.included(base)
    base.class_eval do
      include User::RegistrationValidations

      has_many :leads,
               :as => :creator,
               :dependent => :destroy
      has_many :unique_categories, :through => :category_users, :foreign_key => "user_id", :source => :category

      validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")


      before_validation :set_default_payout

      after_update :update_leads_creator_name_cache
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    private

    def update_leads_creator_name_cache
      if changed.any? { |attr| ["last_name", "first_name"].include?(attr) }
        Lead.update_all({:creator_name => name}, {:id => lead_ids})
      end
    end

    def set_default_payout
      self.payout = 0 if payout.blank?
    end

    public

    def name
      full_name
    end

    def can_publish_leads?
      ![User::NOT_CERTIFIED, User::NOT_CERTIFIED_LOCKED].include?(read_attribute(:certification_level))
    end

    alias_method :to_s, :name
  end
end