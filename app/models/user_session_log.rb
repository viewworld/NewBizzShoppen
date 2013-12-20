class UserSessionLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  validates_presence_of :start_time, :end_time, :log_type, :user_id

  attr_accessor :skip_other_logs

  before_save :cache_hours_count
  after_save :close_logs_for_other_campaigns_and_regular, :unless => :skip_other_logs

  delegate :screen_name, :to => :user, :prefix => true

  TYPE_REGULAR = 0
  TYPE_CAMPAIGN = 1
  DEBUG = true

  before_save do
    self.debug = $request.url if DEBUG and $request
  end

  EXCLUDED_CONTROLLERS = ["UserSessionLogController", "NotificationsController", "Callers::AgentInformationsController"]
  CAMPAIGN_CONTROLLERS = ["Callers::CampaignsDescriptionController", "Callers::CampaignsController", "Callers::MaterialsController"]
  IGNORED_CONTROLLERS = ["TagsController", "Callers::ProductionController", "Callers::CallLogsController", "Flashphoner::ConfigsController"]

  scope :regular_type, where(:log_type => TYPE_REGULAR).order("id ASC")
  scope :campaign_type, where(:log_type => TYPE_CAMPAIGN).order("id ASC")
  scope :with_log_type, lambda{ |log_type| where(:log_type => log_type.to_i) }
  scope :for_user, lambda{|u| where(:user_id => u.to_i)}
  scope :for_users, lambda{|u| where(:user_id => u.to_a)}
  scope :for_campaign, lambda{|c| where(:campaign_id => c.to_i)}
  scope :for_campaigns, lambda{|c| where(:campaign_id => c.to_a)}
  scope :started_between, lambda{|start_date, end_date| where("start_time::DATE BETWEEN ? and ?", start_date.to_date, end_date.to_date) }
  scope :active, lambda{ where("end_time > ?", Time.now) }
  scope :without_campaign, lambda{|c| where("campaign_id <> ?", c.to_i)}
  scope :oldest, order("start_time ASC")
  scope :active_for_user_and_campaign, lambda{ |user,campaign| campaign_type.for_user(user).for_campaign(campaign).active }
  scope :active_for_user_except_campaign, lambda{ |user,campaign| campaign_type.for_user(user).without_campaign(campaign).active }
  scope :active_regular_for_user, lambda{ |user| regular_type.for_user(user).active }
  scope :with_time_from, lambda{ |time| where("start_time >= ?", Time.zone.parse(time)) }
  scope :with_time_to, lambda{ |time| where("end_time <= ?", Time.zone.parse(time)) }
  scope :with_hours, lambda { where("hours_count > 0") }

  include ScopedSearch::Model

  private

  def close_logs_for_other_campaigns_and_regular
    if log_type == TYPE_CAMPAIGN
      self.class.active_for_user_except_campaign(user,campaign).each do |usl|
        usl.skip_other_logs = true
        usl.update_end_time
      end
    elsif log_type == TYPE_REGULAR
      self.class.active_regular_for_user(user).where("id <> ?", id).each do |usl|
        usl.skip_other_logs = true
        usl.update_end_time
      end
    end
  end

  public

  # utilisation
  def percentage_of_hours(total)
    if total.to_f > 0
      hours_count.to_f / total * 100
    else
      0
    end
  end

  def self.close_all_campaign_logs_for_user(user)
    campaign_type.for_user(user).active.each do |usl|
      usl.skip_other_logs = true
      usl.update_end_time
    end
  end

  def self.update_end_time(id, time = nil)
    if usl = UserSessionLog.find_by_id(id)
      usl.update_end_time(time)
    end
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

  def self.update_regular_time(user)
    if usl = active_regular_for_user(user).first
      usl.update_end_time(Settings.logout_time.to_i)
    else
      user.user_session_logs.create(
          :start_time => Time.now,
          :end_time => (Time.now + Settings.logout_time.to_i.minutes),
          :log_type => UserSessionLog::TYPE_REGULAR,
          :time_zone => (user.time_zone.present? ? user.time_zone : "UTC")
      )
    end
  end

  def self.update_campaign_time(user, campaign_id)
    if usl = active_for_user_and_campaign(user, campaign_id).first
      usl.update_end_time(Settings.logout_time.to_i)
    else
      user.user_session_logs.create(
          :start_time => Time.now,
          :end_time => (Time.now + Settings.logout_time.to_i.minutes),
          :log_type => UserSessionLog::TYPE_CAMPAIGN,
          :euro_billing_rate => user.euro_billing_rate,
          :campaign_id => campaign_id,
          :time_zone => (user.time_zone.present? ? user.time_zone : "UTC")
      )
    end
  end

  def self.close_all_logs_for_user(user)
    for_user(user).active.each(&:update_end_time)
  end

  def regular?
    log_type == TYPE_REGULAR
  end

  def campaign?
    log_type == TYPE_CAMPAIGN
  end

  def merge_regular!
    begin
      reload
      usls = UserSessionLog.regular_type.where(:user_id => user_id).where("id <> ?", id).where("EXTRACT(EPOCH FROM(start_time - ?)) BETWEEN 0 AND 180", end_time).reorder("end_time DESC")
      if usls.any?
        update_attribute(:end_time, usls.first.end_time)
        usls.delete_all
      end

      usls = UserSessionLog.regular_type.where(:user_id => user_id).where("id <> ?", id).where("EXTRACT(EPOCH FROM(? - end_time)) BETWEEN  0 AND 180", start_time).reorder("start_time ASC")
      if usls.any?
        update_attribute(:start_time, usls.first.start_time)
        usls.delete_all
      end
    rescue
      false
    end
  end

end
