require 'spec_helper'

describe Lead do

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


end
