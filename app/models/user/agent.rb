class User::Agent < ::User
  ROLES = [:agent]

  include User::RegistrationValidations

  has_many :leads,
           :as => :creator,
           :dependent => :destroy

  validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")

  before_validation :set_default_payout

  after_update :update_leads_creator_name_cache


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

  alias_method :to_s, :name

end