class ChainMailItem < ActiveRecord::Base
  validates_presence_of :body, :chain_mail
  belongs_to :chain_mail

  before_destroy do
    if self.chain_mail.chain_mail_items.count == 1
      self.chain_mail.errors.add(:chain_mail_items, :too_short, :count => 1)
      self.errors.add(:base, :too_short, :count => 1)
      return false
    end
  end
end
