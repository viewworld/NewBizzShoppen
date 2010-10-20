class ::User::Agent < ::User

  has_many :leads, :as => :creator, :dependent => :destroy

  validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")
  before_validation :set_default_payout
  ROLE = :agent
  include User::RegularUser

  private

  def set_default_payout
    self.payout = 0  if payout.blank?
  end
end