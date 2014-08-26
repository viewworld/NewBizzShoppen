module AgentTimesheet::TimesheetBase
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    belongs_to :campaign

    # FIXME: Possible duplicate here, would be better to use user.timesheets instead of timesheets.for_user(user.id)
    scope :show_weekdays, ->(show) { where(dow: 0..4) unless show }
    scope :with_date_between, ->(start_date, end_date) { where("created_at::DATE BETWEEN ? and ?", start_date.to_date, end_date.to_date) }
    scope :for_cweek, ->(cweek) { where(week: cweek.cweek, year: cweek.year) }
    scope :for_dow, ->(dow) { where(dow: dow) }
    scope :for_year, ->(year) { where(year: year) }
    scope :for_campaign, ->(campaign) { where(campaign_id: campaign.id) }
    scope :for_campaigns, ->(campaigns) { where(campaign_id: Array(campaigns).map(&:to_i)) }
    scope :for_agent, ->(user) { where(user_id: user.id) }
    scope :for_agents, ->(users) { where(user_id: Array(users).map(&:to_i)) }
    scope :for_user, ->(user) { where(user_id: user.id) }
    scope :for_users, ->(users) { where(user_id: users.to_a) }
    scope :created_between, ->(start_date, end_date) { where("created_at::DATE BETWEEN ? and ?", start_date.to_date, end_date.to_date) }
  end
end
