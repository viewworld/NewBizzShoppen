class ::User::CallCentre < ::User
  ROLES = [:call_centre]

  include Addresses
  include BankAccounts

  has_and_belongs_to_many :campaigns, :join_table => "campaigns_users", :foreign_key => "user_id"
  has_many :contacts, :foreign_key => :agent_id, :order => "leads.position ASC"
  has_one :bank_address, :class_name => '::Address::Bank', :as => :addressable

  has_many :category_agents, :foreign_key => "user_id"
  has_many :unique_categories, :through => :category_agents, :source => :category
  has_many :campaigns_ownerships, :class_name => "Campaign", :foreign_key => :creator_id
  has_many :news, :as => :resource, :class_name => "User::CallCentre", :dependent => :destroy
  has_many :materials, :as => :resource, :class_name => "Material", :dependent => :destroy

  validates_inclusion_of :payout, :in => 0..100, :message => I18n.t("models.user.payout_validation_message")
  validates_presence_of :company_name

  before_create :allow_payout_information_editing

  after_initialize :build_bank_address_object

  accepts_nested_attributes_for :bank_address

  def allow_payout_information_editing
    self.can_edit_payout_information = true
  end

  def can_publish_leads?
    true
  end

  def leads
    all_leads = Lead.scoped
    all_leads.where("creator_id in (?)", self.subaccounts.map(&:id))
  end

  def comment_threads
    Comment.where(:commentable_id => leads.map(&:id))
  end

  def has_max_contacts_in_campaign?(campaign)
    (contacts.for_campaign(campaign).with_pending_status(false).count >= campaign.max_contact_number)
  end

  def subaccounts_without_locked
    subaccounts.select { |u| u.locked_at.nil? }
  end

  def all_contacts_with_results
    Contact.with_agents(subaccounts.map(&:id)).with_results
  end

  def site
    :faircalls
  end

  private

  def validate_first_and_last_name?
    false
  end

  def build_bank_address_object
    if new_record? or !bank_address
      build_bank_address
    end
  end
end