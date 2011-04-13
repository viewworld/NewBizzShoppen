class LeadPrimaryPurchase < LeadPurchase
  unless ['production','test'].include?(Rails.env)
    LeadSinglePurchase
    LeadBuyout
  else
    require 'lead_single_purchase'
    require 'lead_buyout'
  end
end