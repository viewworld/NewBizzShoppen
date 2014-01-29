require 'spec_helper'

describe Category do

  before(:each) do
    @category1 = LeadCategory.make!
    @category2 = LeadCategory.make!
  end

  it "should update total lead count properly when new lead has been created" do

    lambda {
      Lead.make!(:category_id => @category1.id)
      @category1.reload
    }.should change(@category1, :total_leads_count).by(1)

  end

  it "should update total lead count properly when lead has been destroyed" do
    Lead.make!(:category_id => @category1.id)
    @l2       = Lead.make!(:category_id => @category1.id)
    @category1.reload
    lambda {
      @l2.destroy
      @category1.reload
    }.should change(@category1, :total_leads_count).by(-1)
  end

  it "should update total lead count properly when lead category has been changed" do
    l1 = Lead.make!(:category_id => @category1.id)
    @category1.reload
    @category2.reload

    lambda {
      lambda {
        l1.update_attribute(:category_id, @category2.id)
        @category1.reload
        @category2.reload
      }.should change(@category1, :total_leads_count).by(-1)
    }.should change(@category2, :total_leads_count).by(1)
  end

  it "should update total lead count properly for category with subcategories" do
    @category3 = LeadCategory.make!(:parent_id => @category2.id)

    lambda {
      lambda {
        Lead.make!(:category_id => @category2.id)
        Lead.make!(:category_id => @category3.id)
        @category2.reload
        @category3.reload
      }.should change(@category2, :total_leads_count).by(2)
    }.should change(@category3, :total_leads_count).by(1)
  end

  it "should update published leads count properly when new lead has been published" do

    lambda {
      Lead.make!(:category_id => @category1.id, :published => true)
      @category1.reload
    }.should change(@category1, :published_leads_count).by(1)

    lambda {
      Lead.make!(:category_id => @category1.id, :published => false)
      @category1.reload
    }.should_not change(@category1, :published_leads_count).by(1)
  end

  context "destroy" do
    before(:each) do
      @lead_category = LeadCategory.make!
      @deal_category = DealCategory.make!
    end
    it "should not be destroyed when leads present" do
      Lead.make!(:category => @lead_category)
      @lead_category.reload
      @lead_category.destroy.should be_false
    end

    it "should not be destroyed when deals present" do
      Deal.make!(:category => @deal_category)
      @deal_category.reload
      @deal_category.destroy.should be_false
    end

    it "should not be destroyed when countries present" do
      @lead_category.countries << Country.make!
      @lead_category.save
      @lead_category.destroy.should be_false
    end

    it "should not be destroyed when customers present" do
      @lead_category.customers << User::Supplier.make!
      @lead_category.save
      @lead_category.destroy.should be_false
    end

    it "should not be destroyed when agents present" do
      @lead_category.agents << User::Agent.make!
      @lead_category.save
      @lead_category.destroy.should be_false
    end

    it "should not be destroyed when campaigns present" do
      Campaign.make!(:category => @lead_category)
      @lead_category.reload
      @lead_category.destroy.should be_false
    end

    it "should not be destroyed when buying users present" do
      @category_supplier = User::CategorySupplier.make!
      @category_supplier.buying_categories << @lead_category
      @category_supplier.save
      @lead_category.reload
      @lead_category.destroy.should be_false
    end

    it "should not be destroyed when subscriber users present" do
      @category_supplier = User::Supplier.make!
      @category_supplier.categories << @lead_category
      @category_supplier.save
      @lead_category.reload
      @lead_category.destroy.should be_false
    end
  end

end
