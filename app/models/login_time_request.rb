class LoginTimeRequest < ActiveRecord::Base
  DATE_FORMAT = '%d-%m-%Y'

  attr_accessor :whole_day,
                :whole_day_start_time,
                :whole_day_end_time,
                :whole_day_start_date,
                :whole_day_end_date

  validates_presence_of :campaign_id, :user_id, :creator_id
  validates_presence_of :start_time, :end_time, :unless => :whole_day?
  validates_presence_of :whole_day_start_time,
                        :whole_day_end_time,
                        :whole_day_start_date,
                        :whole_day_end_date, :if => :whole_day?

  validate do
    if whole_day?
      self.errors.add(:whole_day_start_time, I18n.t('activerecord.errors.models.login_time_request.attributes.whole_day_start_time.bigger_then_whole_day_end_time')) if whole_day_start_time >= whole_day_end_time
      self.errors.add(:whole_day_start_date, I18n.t('activerecord.errors.models.login_time_request.attributes.whole_day_start_date.bigger_then_whole_day_end_date')) if whole_day_start_date > whole_day_end_date
    else
      self.errors.add(:start_time, I18n.t('activerecord.errors.models.login_time_request.attributes.start_time.bigger_then_end_time')) if start_time >= end_time
    end
  end

  belongs_to :campaign
  belongs_to :user
  belongs_to :creator, :class_name => 'User'
  belongs_to :approver, :class_name => 'User'
  belongs_to :user_session_log, :dependent => :destroy

  include ScopedSearch::Model
  include AASM

  scope :with_campaign, lambda { |campaign| where(:campaign_id => campaign.to_i) }
  scope :with_user, lambda { |user| where(:user_id => user.to_i) }
  scope :with_time_from, lambda { |time| where('start_time >= ?', Time.zone.parse(time)) }
  scope :with_time_to, lambda { |time| where('end_time <= ?', Time.zone.parse(time)) }
  scope :with_state, lambda { |state| where(:aasm_state => state) }

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
        :log_type => 1,
        :time_zone => (user.time_zone.present? ? user.time_zone : "UTC"))
    self.user_session_log_id = usl.id
  end

  def hours_count
    (end_time - start_time).to_i.to_time('%H:%M')
  end

  def can_be_managed_by?(current_user)
    current_user.admin? or (current_user.call_centre? and current_user.self_and_descendants.include?(current_user))
  end

  def whole_day_start_time_value(current_user)
    current_user.country.work_start_at_value
  end

  def whole_day_end_time_value(current_user)
    current_user.country.work_end_at_value
  end

  def whole_day_start_date_value
    whole_day_date_value(whole_day_start_date)
  end

  def whole_day_end_date_value
    whole_day_date_value(whole_day_end_date)
  end

  def whole_day?
    whole_day == '1'
  end

  private

  def whole_day_date_value(value)
    value.try(:strftime, DATE_FORMAT) || Date.today.strftime(DATE_FORMAT)
  end
end
