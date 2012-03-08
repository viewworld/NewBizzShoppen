class ChainMailItem < ActiveRecord::Base
  acts_as_list :scope => :chain_mail_id

  validates_presence_of :subject, :body
  belongs_to :chain_mail

  before_destroy do
    if self.chain_mail.chain_mail_items.count == 1
      self.chain_mail.errors.add(:chain_mail_items, :too_short, :count => 1)
      self.errors.add(:base, :too_short, :count => 1)
      return false
    end
  end

  def run_at
    Time.zone.parse("#{chain_mail.execution_time.hour}:#{chain_mail.execution_time.min}") +
        chain_mail.first_execution_delay.to_i.days +
        (position - 1) * chain_mail.cycle_time.to_i.days
  end
end
