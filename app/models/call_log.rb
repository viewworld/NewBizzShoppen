class CallLog < ActiveRecord::Base

  belongs_to :contact
  belongs_to :campaign
  #belongs_to :caller, :polymorphic => true

  scope :for_campaigns, lambda { |campaign_ids| where("call_logs.campaign_id in (?)", campaign_ids.to_a) unless campaign_ids.to_a.empty? }
  scope :with_state, lambda { |state| where(:state => state) }
  scope :answered, where(:state => "FINISH").joins("RIGHT JOIN call_logs cl ON cl.call_id = call_logs.call_id AND cl.state = 'TALK'")
  scope :finished, with_state("FINISH")

end
