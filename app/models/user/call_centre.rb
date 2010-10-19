class ::User::CallCentre < ::User
  validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")
  before_create :set_role

  def set_role
    self.roles = [:call_centre]
  end
end