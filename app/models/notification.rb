class Notification < ActiveRecord::Base

  # object to which notification is displayed
  belongs_to :notificable, :polymorphic => true

  # object which triggered notification
  belongs_to :notifier, :polymorphic => true

  validates_presence_of :notify_at, :notificable, :title, :text

  scope :pending, lambda { where("dismissed_at IS NULL AND notify_at < ?", Time.zone.now) }

end
