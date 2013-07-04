class CampaignChainMailType < ChainMailType

  validates_presence_of :campaign, :unless => Proc.new{|cmt| cmt.skip_validations}
end