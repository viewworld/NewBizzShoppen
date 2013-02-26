class UserSessionLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  validates_presence_of :start_time, :end_time, :log_type, :user_id

  attr_accessor :skip_other_logs

  before_save :cache_hours_count
  after_save :close_logs_for_other_campaigns, :unless => :skip_other_logs

  TYPE_REGULAR = 0
  TYPE_CAMPAIGN = 1

  scope :regular_type, where(:log_type => TYPE_REGULAR).order("id ASC")
  scope :campaign_type, where(:log_type => TYPE_CAMPAIGN).order("id ASC")
  scope :for_user, lambda{|u| where(:user_id => u.to_i)}
  scope :for_users, lambda{|u| where(:user_id => u.to_a)}
  scope :for_campaign, lambda{|c| where(:campaign_id => c.to_i)}
  scope :for_campaigns, lambda{|c| where(:campaign_id => c.to_a)}
  scope :started_between, lambda{|start_date, end_date| where("start_time BETWEEN ? and ?", start_date.to_datetime, end_date.to_datetime) }
  scope :active, lambda{ where("end_time > ?", Time.now) }
  scope :without_campaign, lambda{|c| where("campaign_id <> ?", c.to_i)}
  scope :oldest, order("start_time ASC")

  private

  def close_logs_for_other_campaigns
    if log_type == TYPE_CAMPAIGN
      self.class.active_for_user_except_campaign(user,campaign).each do |usl|
        usl.skip_other_logs = true
        usl.update_end_time
      end
    end
  end

  public

  def self.close_all_campaign_logs_for_user(user)
    campaign_type.for_user(user).active.each do |usl|
      usl.skip_other_logs = true
      usl.update_end_time
    end
  end

  def self.update_end_time(id, time = nil)
    UserSessionLog.find(id).update_attribute(:end_time, time ? (Time.now + time.minutes) : Time.now) if UserSessionLog.find_by_id(id)
  end

  def update_end_time(time = nil)
    update_attribute(:end_time, time ? (Time.now + time.minutes) : Time.now)
  end

  def expired?
    end_time <= Time.now
  end

  def cache_hours_count
    self.hours_count = (((end_time - start_time) / 60) / 60.0).to_f.round(2)
  end

  def self.active_for_user_and_campaign(user,campaign)
    campaign_type.for_user(user).for_campaign(campaign).active.first
  end

  def self.active_for_user_except_campaign(user,campaign)
    campaign_type.for_user(user).without_campaign(campaign).active
  end

  def regular?
    log_type == TYPE_REGULAR
  end

  def campaign?
    log_type == TYPE_CAMPAIGN
  end

end