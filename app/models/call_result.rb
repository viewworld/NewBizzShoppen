class CallResult < ActiveRecord::Base
  belongs_to :contact
  belongs_to :result
  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  has_one :call_log
  has_many :result_values
  accepts_nested_attributes_for :result_values, :allow_destroy => true
  accepts_nested_attributes_for :contact

  validates_presence_of :result_id, :creator_id, :contact_id

  after_create :process_side_effects
  after_destroy :update_completed_status, :update_pending_status

  PENDING_RESULT_TYPES = [:call_back, :not_interested_now]

  scope :call_log_results, joins(:result).where(:results => { :final => false })
  scope :final_results, joins(:result).where(:results => { :final => true })

  def called?
    call_log.present?
  end

  def all_result_values(selected_result)
    result = Result.find(selected_result)
    result.result_fields.map do |field|
      result_value = result_values.detect { |rv| rv.result_field == field }
      result_value = ResultValue.new(:result_field => field) if result_value.nil?
      result_value
    end
  end

  def can_be_managed_by?(user)
    creator.id == user.id or user.has_one_of_roles?(:admin, :call_centre)
  end

  class << self

    def for_table_header(date_from, date_to)
      DateCalculator.days_or_ranges(date_from, date_to, 14).inject([]) do |result, output|
        result << (output.class == Range ? "#{output.first.strftime(DateCalculator::FORMAT)} #{output.last.strftime(DateCalculator::FORMAT)}" : output.strftime(DateCalculator::FORMAT))
      end
    end

    def for_table_row(date_from, date_to, result_ids, agent_ids, campaign_id)
      DateCalculator.days_or_ranges(date_from, date_to, 14).inject([]) do |result, output|
        date_start, date_stop = output.class == Range ? [output.first, output.last] : [output, output]
        results = CallResult.joins(:contact).where(:leads => {:campaign_id => campaign_id }, :result_id => result_ids, :creator_id => agent_ids).where("call_results.created_at < '#{date_stop.strftime("%Y-%m-%d")} 23:59:59' and call_results.created_at > '#{date_start.strftime("%Y-%m-%d")} 00:00:01'")            
        result << {:number => results.size, :ids => results.map(&:id).blank? ? [0] : results.map(&:id) }
      end
    end

  end

  private

  def update_completed_status
    completed_status = contact.current_call_result.present? ? contact.current_call_result.result.final? : false
    contact.update_attributes :completed => completed_status
  end

  def update_pending_status
    pending_status = contact.current_call_result.present? ? (PENDING_RESULT_TYPES.include?(contact.current_call_result.result.label) and contact.should_be_pending?) : false
    contact.update_attributes :pending => pending_status
  end


  def process_side_effects
    if result.generic?
      send "process_for_#{result.label.to_s}"
    else
      result.final? ? process_for_final_result : process_for_call_log_result
    end
  end

  def process_for_call_back
    if Date.parse(result_values.first.value) > contact.campaign.end_date
      process_for_final_result
    else
      process_for_call_log_result
    end
  end

  def process_for_not_interested_now
    process_for_call_back
  end

  def process_for_not_in
    process_for_call_log_result
  end

  def process_for_not_interested
    process_for_final_result
  end

  def process_for_meeting_booked
    process_for_final_result
  end

  def process_for_custom_result
    process_for_final_result
  end

  def process_for_upgraded_to_lead
    contact.upgrade_to_lead
    process_for_final_result
  end

  def process_for_call_log_result
    contact.update_attributes(:pending => PENDING_RESULT_TYPES.include?(result.label))
    contact.move_to_bottom
  end

  def process_for_final_result
    contact.remove_from_list
    contact.update_attributes(:completed => true, :agent_id => nil)
    contact.insert_at
  end

end