class EmailBounce < ActiveRecord::Base

  include ScopedSearch::Model

  belongs_to :user, :foreign_key => :email, :primary_key => :email

  scope :with_email, lambda{|email| where(:email => email)}

end