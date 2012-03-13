class ChainMailType < ActiveRecord::Base
  serialize :execution_conditions

  has_many :chain_mail_items, :dependent => :destroy, :order => "position ASC"
  has_many :chain_mails
  has_many :call_results
  has_many :materials, :class_name => "Asset::ChainMailMaterial", :as => :resource, :conditions => "asset_type = 'Asset::ChainMailMaterial'", :dependent => :destroy
  belongs_to :campaign

  validates_presence_of :name, :first_execution_delay, :cycle_time, :execution_time, :campaign
  validates_length_of :chain_mail_items, :execution_conditions, :minimum => 1
  validates_associated :chain_mail_items
  validate :has_at_least_one_item, :execution_conditions_format

  scope :with_active, where(:active => true)
  scope :for_campaign, lambda{|campaign| where(:campaign_id => campaign.to_i)}

  accepts_nested_attributes_for :chain_mail_items, :allow_destroy => true

  STOP_IF = 1
  SEND_IF = 2
  EXECUTION_TYPES = [
      ['stop if', STOP_IF],
      ['send if', SEND_IF]
  ]

  LOGGED_IN = 1
  LINK_CLICKED = 2
  EXECUTION_CONDITIONS = [
      ['logged in', LOGGED_IN],
      ['clicked link', LINK_CLICKED]
  ]

  OR = 1
  AND = 2
  EXECUTION_CONDITION_OPERATORS = [
      ['or', 1],
      ['and', 2]
  ]

  after_initialize do
    self.execution_conditions = {} if execution_conditions.nil?
    self.execution_conditions["conditions"] = [] if execution_conditions["conditions"].nil?
  end

  before_validation do
    self.execution_conditions["conditions"] = execution_conditions["conditions"].reject{|elem| elem.blank?}.map(&:to_i)
    self.execution_conditions["type"] = execution_conditions["type"].to_i
    self.execution_conditions["operator"] = (execution_conditions["operator"].blank? ? nil : execution_conditions["operator"].to_i)
  end

  private

  def has_at_least_one_item
    if chain_mail_items.empty? or chain_mail_items.select {|cmi| !cmi._destroy }.empty?
      self.errors.add(:chain_mail_items, :too_short, :count => 1)
      false
    end
  end

  def execution_conditions_format
    if (execution_conditions["operator"].nil? and execution_conditions["conditions"].size != 1) or
        (!execution_conditions["operator"].nil? and execution_conditions["conditions"].size == 1)
      self.errors.add(:execution_conditions, :invalid)
      false
    end
  end

end
