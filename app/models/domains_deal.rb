class DomainsDeal < ActiveRecord::Base
  belongs_to :domain
  belongs_to :deal
end
