class Notification < ActiveRecord::Base

  belongs_to :notificable, :polymorphic => true

  validates_presence_of :notify_at, :notificable, :title, :text

  scope :pending, lambda { where("dismissed_at IS NULL AND notify_at < ?", Time.zone.now) }

end
