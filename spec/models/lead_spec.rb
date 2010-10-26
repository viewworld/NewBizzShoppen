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

    nested_params = {"lead_translations_attributes"=>[ {"header"=>"sdgsdfg",
    "locale"=>"dk",
    "description"=>"fdfgfdg",
    "hidden_description"=>"dfgdfgdfg"}]}

    lead.update_attributes(nested_params)
    lead.valid?.should == true
    lead.lead_translations.detect { |lt| lt.locale.to_s == "dk" }.should_not == nil
  end


end