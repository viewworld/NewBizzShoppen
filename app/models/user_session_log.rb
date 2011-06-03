class UserSessionLog < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :start_time, :end_time, :log_type, :user_id

  TYPE_REGULAR = 0
  TYPE_CAMPAIGN = 1

  scope :regular, where(:log_type => TYPE_REGULAR).order("id ASC")
  scope :campaign, where(:log_type => TYPE_CAMPAIGN).order("id ASC")

  def self.update_end_time(id, time = nil)
    UserSessionLog.find(id).update_attribute(:end_time, time ? (Time.now + time.minutes) : Time.now) if UserSessionLog.find(id)
  end

  def expired?
    end_time <= Time.now
  end

end