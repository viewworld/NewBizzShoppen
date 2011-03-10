class ::User::CallCentre < ::User
  ROLES = [:call_centre]

  include Addresses
  include BankAccounts

  has_one :bank_address, :class_name => '::Address::Bank', :as => :addressable

  has_many :category_agents, :foreign_key => "user_id"
  has_many :unique_categories, :through => :category_agents, :source => :category

  validates_inclusion_of :payout, :in => 0..100, :message =>   I18n.t("models.user.payout_validation_message")

  before_create :allow_payout_information_editing

  after_initialize :build_bank_address_object

  accepts_nested_attributes_for :bank_address

  def allow_payout_information_editing
    self.can_edit_payout_information = true
  end

  def can_publish_leads?
    true
  end

  private

  def build_bank_address_object
    if new_record? or !bank_address
      build_bank_address
    end
  end
end