class CampaignChainMailType < ChainMailType

  validates_presence_of :campaign, :unless => Proc.new{|cmt| cmt.skip_validations}

  EXECUTION_CONDITIONS = [
      ['logged in', LOGGED_IN],
      ['clicked link', LINK_CLICKED]
  ]
end