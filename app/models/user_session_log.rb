class UserSessionLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  validates_presence_of :start_time, :end_time, :log_type, :user_id

  before_save :cache_hours_count

  TYPE_REGULAR = 0
  TYPE_CAMPAIGN = 1

  scope :regular, where(:log_type => TYPE_REGULAR).order("id ASC")
  scope :campaign, where(:log_type => TYPE_CAMPAIGN).order("id ASC")
  scope :for_user, lambda{|u| where(:user_id => u.to_i)}
  scope :started_between, lambda{|start_date, end_date| where("start_time BETWEEN ? and ?", start_date.to_datetime, end_date.to_datetime) }

  def self.update_end_time(id, time = nil)
    UserSessionLog.find(id).update_attribute(:end_time, time ? (Time.now + time.minutes) : Time.now) if UserSessionLog.find_by_id(id)
  end

  def expired?
    end_time <= Time.now
  end

  def cache_hours_count
    self.hours_count = (((end_time - start_time) / 60) / 60.0).to_f.round(2)
  end

end