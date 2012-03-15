class ChainMailItem < ActiveRecord::Base
  acts_as_list :scope => :chain_mail_type_id

  validates_presence_of :subject, :body
  belongs_to :chain_mail_type

  has_and_belongs_to_many :chain_mail_materials, :class_name => "Asset::ChainMailMaterial"

  before_destroy do
    if self.chain_mail_type.chain_mail_items.count == 1
      self.chain_mail_type.errors.add(:chain_mail_items, :too_short, :count => 1)
      self.errors.add(:base, :too_short, :count => 1)
      return false
    end
  end

  def run_at
    Time.zone.parse("#{chain_mail_type.execution_time.hour}:#{chain_mail_type.execution_time.min}") +
        chain_mail_type.first_execution_delay.to_i.days +
        (position - 1) * chain_mail_type.cycle_time.to_i.days
  end
end
