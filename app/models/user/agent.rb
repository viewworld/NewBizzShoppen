class ::User::Agent < ::User
  ROLES = [:agent]

  include User::RegistrationValidations

  has_many :leads, :as => :creator, :dependent => :destroy

  validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")

  before_validation :set_default_payout

  private

  def set_default_payout
    self.payout = 0 if payout.blank?
  end

  public

  def to_s
    full_name
  end
end