class Callers::ProductionController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  include ::CampaignActions

   before_filter :set_campaign, :only => [:show]
end