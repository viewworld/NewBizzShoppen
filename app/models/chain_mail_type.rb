class ChainMailType < ActiveRecord::Base
  attr_accessor :skip_validations, :add_new_item
  serialize :execution_conditions

  include ScopedSearch::Model

  has_many :chain_mail_items, :dependent => :destroy, :order => "position ASC"
  has_many :chain_mails
  has_many :call_results
  has_many :materials, :class_name => "Asset::ChainMailMaterial", :as => :assetable, :dependent => :destroy
  has_many :survey_options
  belongs_to :campaign
  belongs_to :result
  belongs_to :email_template_signature
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"

  validates_presence_of :name, :first_execution_delay, :cycle_time, :execution_time, :unless => Proc.new{|cmt| cmt.skip_validations}
  validates_length_of :chain_mail_items, :execution_conditions, :minimum => 1, :unless => Proc.new{|cmt| cmt.skip_validations or cmt.add_new_item.present? }
  validates_associated :chain_mail_items, :unless => Proc.new{|cmt| cmt.skip_validations}
  validate :has_at_least_one_item, :unless => Proc.new{|cmt| cmt.skip_validations or cmt.add_new_item.present? }
  validate :execution_conditions_format, :unless => Proc.new{|cmt| cmt.skip_validations}

  scope :with_active, where(:active => true, :archived => false)
  scope :with_archived, lambda{|b| b.to_s == "1" ? where("archived IS NOT NULL") : where(:archived => false) }
  scope :without_drafts, where("name IS NOT NULL")
  scope :with_keyword, lambda{|q| where("name LIKE :keyword", {:keyword => "%#{q.downcase}%"})}
  scope :for_campaign, lambda{|campaign| where(:campaign_id => campaign.to_i)}
  scope :with_campaign, lambda{|c| where(:campaign_id => c.to_i)}
  scope :with_result, lambda{ |result| where(:result_id => result.id) }
  scope :for_user, lambda { |user| user.admin? ? where("true") : where(:creator_id => user.id) }

  scoped_order :id, :name

  accepts_nested_attributes_for :chain_mail_items, :allow_destroy => true

  STOP_IF = 1
  SEND_IF = 2
  EXECUTION_TYPES = [
      ['stop if', STOP_IF],
      ['send if', SEND_IF]
  ]

  LOGGED_IN = 1
  LINK_CLICKED = 2

  SURVEY_NOT_OPENED = 3
  SURVEY_INCOMPLETE = 4
  SURVEY_COMPLETE = 5


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

  def self.purge_drafts!
    where("active IS FALSE and name is null").destroy_all
  end

  def campaign_name
    campaign ? campaign.name : 'no campaign selected'
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
