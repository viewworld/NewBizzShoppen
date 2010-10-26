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


end