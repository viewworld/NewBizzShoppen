class CallLog < ActiveRecord::Base

  belongs_to :contact
  belongs_to :campaign
#  belongs_to :user, :polymorphic => true, :foreign_id => "caller_id", :foreign_type => "caller_type"

  scope :for_campaigns, lambda { |campaign_ids| where("call_logs.campaign_id in (?)", campaign_ids.to_a) unless campaign_ids.to_a.empty? }
  scope :with_state, lambda { |state| where(:state => state) }
  scope :answered, where(:state => "FINISH").joins("RIGHT JOIN call_logs cl ON cl.call_id = call_logs.call_id AND cl.state = 'TALK'")
  scope :finished, with_state("FINISH")
  scope :ringing, with_state("RINGING")
  scope :talk, with_state("TALK")
  scope :created_between, lambda{ |from, to| where( "call_logs.created_at::DATE BETWEEN ? AND ?", from.to_date, to.to_date ) }
  scope :for_users, lambda { |user_ids| where(:caller_id => Array(user_ids) ) }
  scope :join_on_next_with_state, lambda { |state| joins("INNER JOIN call_logs next_cl ON next_cl.id = (SELECT id FROM call_logs cl WHERE cl.created_at > call_logs.created_at and cl.state = '#{state}' ORDER BY cl.created_at LIMIT 1)") }
  scope :next_created_within, lambda { |minutes| where("EXTRACT(EPOCH FROM (next_cl.created_at - call_logs.created_at)) < ?", minutes.to_i*60) }

  def call_result
    CallResult.where(:contact_id => contact_id, :creator_id => caller_id).
        where("call_results.created_at >= :call_log AND @EXTRACT(EPOCH FROM (call_results.created_at - :call_log)) < 3600", :call_log => created_at).
        first
  end

end
