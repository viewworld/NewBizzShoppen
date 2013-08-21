class ::User::CallCentreAgent < ::User
  ROLES = [:call_centre_agent]

  include User::CommonAgent
  include Addresses
  include BankAccounts
  include User::CommonCaller

  has_many :deals, :as => :creator

  def can_publish_leads?
    true
  end

  def comment_threads
    Comment.with_leads_created_by(self)
  end
  
end