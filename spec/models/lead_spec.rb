require 'spec_helper'

describe Lead do
  fixtures :all

  it "should properly cache creator name" do
    lead = Lead.make!
    lead.creator_name.should == lead.creator.name
  end


  it "should properly update cache of creator name if creator name has changed" do
    lead = Lead.make!
    lead.creator_name.should == lead.creator.name

    creator = lead.creator
    creator.update_attributes(:first_name => "John", :last_name => "Perry")
    creator.save!

    lead.reload
    lead.creator_name.should == "John Perry"
  end

  it "should accept nested translations" do
    lead = Lead.make!

    nested_params = {"lead_translations_attributes"=>[ {"header"=>"Fake header",
    "locale"=>"da",
    "description"=>"Fake description",
    "hidden_description"=>"Fake hidden description"}]}

    lead.update_attributes(nested_params)
    lead.valid?.should == true
    lead.lead_translations.detect { |lt| lt.locale.to_s == "da" }.should_not == nil
  end


  context "Generation of lead from sales manager's deal" do
    before(:each) do
      @deal_admin = User.find_by_email(Settings.default_deal_admin_email)
      @buyer = User::Supplier.make!(:email => "buyer_deal_maker@nbs.com", :deal_maker_role_enabled => true)
      @purchase_manager = User::Member.make!(:email => "purchase_manager101@nbs.com")
      @deal = Deal.make!(:email_address => "buyer_deal_maker@nbs.com", :published => true, :header => "Printers deal", :description => "Some desc of this", :price => 0)
      @deal.creator = @buyer
      @deal.save
      @lead = Lead.new
      @lead.based_on_deal(@deal, @purchase_manager)
      @lead.save
    end

    it "should have proper header and description" do
      @lead.header.should == "A company is interested in Printers deal"
      @lead.description.should == "A company is interested in Some desc of this"
    end

    it "should have purchase manager's contact info" do
      @lead.contact_name.should == @purchase_manager.full_name
      @lead.email_address.should == @purchase_manager.email
      @lead.address_line_1.should == @purchase_manager.address.address_line_1
      @lead.address_line_2.should == @purchase_manager.address.address_line_2
      @lead.address_line_3.should == @purchase_manager.address.address_line_3
      @lead.zip_code.should == @purchase_manager.address.zip_code
    end

    it "should have creator set as deal admin because it was created by sales manager" do
      @lead.creator == @deal_admin
    end

    it "should have lead price equal to deal price" do
      @lead.price.should == 0
    end

    it "should have purchase decision set to expire time for deal plus 7 days" do
      @lead.purchase_decision_date.should == @deal.end_date+7
    end

    it "should have sale limit equal to 1" do
      @lead.sale_limit.should == 1
    end
  end

  context "Generation of lead from call centre agent's deal" do
    before(:each) do
      @deal_admin = User.find_by_email(Settings.default_deal_admin_email)
      @agent = User::CallCentreAgent.make!(:email => "agent_deal_maker@nbs.com", :deal_maker_role_enabled => true)
      @purchase_manager = User::Member.make!(:email => "purchase_manager101@nbs.com")
      @buyer = User::Supplier.make!(:email => "buyer_deal_maker@nbs.com", :company_name => "Xansara")
      @deal = Deal.make!(:email_address => "buyer_deal_maker@nbs.com", :published => true, :header => "Printers deal", :description => "Some desc of this", :use_company_name_as_category => true)
      @deal.creator = @agent
      @deal.save
      @lead = Lead.new
      @lead.based_on_deal(@deal, @purchase_manager)
      @lead.save
    end

    it "should have creator set as deal admin because it was created by sales manager" do
      @lead.creator.email.should == @deal.deal_admin.email
    end
  end

  context "destroy" do
    before(:each) do
      @lead = Lead.make!
    end

    it "should not be destroyed when lead purchases are created" do
      LeadPurchase.make!(:lead => @lead)
      @lead.reload
      @lead.destroy.should be_false
    end
  end
end