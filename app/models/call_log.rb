class CallLog < ActiveRecord::Base

  belongs_to :call_result

  before_create :set_duration

  

  private
  def set_duration
    self.end_time = DateTime.now
    self.duration = end_time.to_i - start_time.to_i
  end

end
