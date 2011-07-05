class CampaignReport

  attr_accessor :campaign

  def initialize(campaign)
    self.campaign = campaign
  end

  def target_success_percent
    campaign.success_rate
  end

  def realised_success_percent

  end
end