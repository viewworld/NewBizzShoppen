class LeadRequest < ActiveRecord::Base
  set_table_name "lead_purchases"
  default_scope where("requested_by IS NOT NULL")
end