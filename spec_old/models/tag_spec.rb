require 'spec_helper'

describe ActsAsTaggableOn::Tag do
  fixtures :all

  before(:each) do
    @tag = ActsAsTaggableOn::Tag.make!
    @tag1 = ActsAsTaggableOn::Tag.make!
    @tag2 = ActsAsTaggableOn::Tag.make!
    2.times do |i|
      lead = Lead.make!
      lead.tag_list << @tag.to_s
      lead.tag_list << @tag1.to_s
      lead.save

      user = User::Member.make!
      user.tag_list << @tag.to_s
      user.tag_list << @tag1.to_s
      user.save

      deal = Deal.make!
      deal.tag_list << @tag2.to_s
      deal.save
    end
  end

  it "should be possible to duplicate itself" do
    @tag_copy = @tag.duplicate!(@tag.name+Time.now.to_i.to_s)
    @tag_copy.should be_an_instance_of(ActsAsTaggableOn::Tag)
    @tag_copy.should be_persisted
    @tag_copy.taggings.size.should == @tag.taggings.size
  end

  it "should NOT be possible to duplicate itself when name is blank or not unique" do
    @tag_copy = @tag.duplicate!(@tag.name)
    @tag_copy.should be_false

    @tag_copy = @tag.duplicate!("")
    @tag_copy.should be_false
  end

  it "should be possible to merge with other tags" do
    @taggings_count = @tag.taggings.count

    @tag.update_attributes(:merge_with_tags => true)
    @tag.taggings.count.should == @taggings_count

    @tag.update_attributes!(:merge_with_tags => true, :merge_with_tag_names => [@tag1.to_s, @tag2.to_s])
    @tag.taggings.count.should == @taggings_count + 2
    ActsAsTaggableOn::Tag.where(:id => [@tag1.id, @tag2.id]).to_a.should_not be_empty
  end

  it "should be possible to merge with other tags and delete them afterwards" do
    @taggings_count = @tag.taggings.count

    @tag.update_attributes!(:merge_with_tags => true, :merge_with_tag_names => [@tag1.to_s, @tag2.to_s], :merge_with_cleanup => true)
    @tag.taggings.count.should == @taggings_count + 2
    ActsAsTaggableOn::Tag.where(:id => [@tag1.id, @tag2.id]).to_a.should be_empty
  end
end