class ArchivedEmail < ActiveRecord::Base
  NOT_SENT = 0.freeze
  SENT     = 1.freeze
  BOUNCED  = 2.freeze

  include ScopedSearch::Model

  belongs_to :related, :polymorphic => true
  serialize :bounce_details, Hash

  scope :bounced, where(:status => BOUNCED)
  scope :with_email, lambda{|email| where(:to => email)}

  belongs_to :sender, :class_name => "User"
end
