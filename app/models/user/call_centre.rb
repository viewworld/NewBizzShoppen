class ::User::CallCentre < ::User
  ROLES = [:call_centre]

  validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")
end