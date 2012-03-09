class ChainMailType < ActiveRecord::Base
  serialize :execution_conditions

  has_many :chain_mail_items, :dependent => :destroy, :order => "position ASC"
  has_many :chain_mails
  has_many :call_results
  has_many :materials, :class_name => "Asset::ChainMailMaterial", :as => :resource, :conditions => "asset_type = 'Asset::ChainMailMaterial'", :dependent => :destroy

  validates_presence_of :name, :first_execution_delay, :cycle_time, :execution_time
  validates_length_of :chain_mail_items, :execution_conditions, :minimum => 1
  validates_associated :chain_mail_items
  validate :has_at_least_one_item

  scope :active

  accepts_nested_attributes_for :chain_mail_items, :allow_destroy => true

  NOT_SIGNED_IN = 1
  NO_LINK_CLICKED = 2

  EXECUTION_CONDITIONS = [
      ['Recipient did not sign in', NOT_SIGNED_IN],
      ['Recipient did not clicked any link', NO_LINK_CLICKED]
  ]

  after_initialize do
    self.execution_conditions = [] if execution_conditions.nil?
  end

  before_validation do
    self.execution_conditions = execution_conditions.reject{|elem| elem.blank?}.map(&:to_i)
  end

  private

  def has_at_least_one_item
    if chain_mail_items.empty? or chain_mail_items.select {|cmi| !cmi._destroy }.empty?
      self.errors.add(:chain_mail_items, :too_short, :count => 1)
      false
    end
  end

end
