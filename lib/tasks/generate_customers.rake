namespace :nbs do
  desc "Generate customers, leads and lead purchases"
  task :generate_customers => :environment do

    require "spec/support/blueprints"

    customer = User.make!(:email => "customer1@nodomain1.com", :roles => "customer")
    lead_buyer = User.make!(:email => "leadbuyer1@nodomain1.com", :parent_id => customer.id, :roles => "lead_buyer")
    lead_user = User.make!(:email => "leaduser1@nodomain1.com", :parent_id => customer.id, :roles => "lead_user")
    agent = User.make!(:email => "agent1@nodomain.com", :roles => "agent")

    categories = []
    (1..3).each do |i|
      categories << Category.make!
    end

    leads = []
    (1..5).each do |lead|
      leads << Lead.make!(:creator => agent, :category => categories[rand(3)])
    end

    (0..2).each do |i|
      LeadPurchase.make!(:owner => customer, :lead => leads[i], :paid =>  true, :accessible => true)
    end

  end
end