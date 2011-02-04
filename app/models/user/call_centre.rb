class ::User::CallCentre < ::User
  ROLES = [:call_centre]

  include Addresses

  validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")

  before_create :allow_payout_information_editing

  def allow_payout_information_editing
    self.can_edit_payout_information = true
  end
end