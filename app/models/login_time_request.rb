class LoginTimeRequest < ActiveRecord::Base

  attr_accessor :show_inactive_campaigns

  validates_presence_of :campaign_id, :user_id, :creator_id, :start_time, :end_time
  validate do
    if start_time >= end_time then
      self.errors.add :start_time, "must be prior to end time"
    end
  end

  belongs_to :campaign
  belongs_to :user
  belongs_to :creator, :class_name => 'User'
  belongs_to :approver, :class_name => 'User'
  belongs_to :user_session_log, :dependent => :destroy

  include ScopedSearch::Model
  include AASM

  scope :with_campaign, lambda{ |campaign| where(:campaign_id => campaign.to_i) }
  scope :with_user, lambda{ |user| where(:user_id => user.to_i) }
  scope :with_time_from, lambda{ |time| where("start_time >= ?", Time.zone.parse(time)) }
  scope :with_time_to, lambda{ |time| where("end_time <= ?", Time.zone.parse(time)) }
  scope :with_state, lambda{ |state| where(:aasm_state => state) }

  aasm_initial_state :new

  aasm_state :new
  aasm_state :approved, :enter => :perform_approval
  aasm_state :rejected

  aasm_event :approve do
    transitions :from => :new, :to => :approved
  end

  aasm_event :reject do
    transitions :from => :new, :to => :rejected
  end

  def perform_approval
    usl = UserSessionLog.create(
        :user_id => user_id,
        :start_time => start_time,
        :end_time => end_time,
        :campaign_id => campaign_id,
        :log_type => 1)
    self.user_session_log_id = usl.id
  end

  def hours_count
    (end_time - start_time) / 3600
  end

  def can_be_managed_by?(current_user)
    current_user.admin? or (current_user.call_centre? and current_user.self_and_descendants.include?(current_user))
  end

end
