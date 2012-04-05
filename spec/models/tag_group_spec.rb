require 'spec_helper'

describe TagGroup do
  fixtures :all

  before(:each) do
    @tag_group = TagGroup.create(:match_all => false)
    @tag_group.tag_list << "some tag1"
    @tag_group.tag_list << "some tag2"
    @tag_group.save

    @contact1 = Contact.make!
    @contact1.tag_list << "some tag1"
    @contact1.tag_list << "some tag2"
    @contact1.save

    @contact2 = Contact.make!
    @contact2.tag_list << "some tag1"
    @contact2.save

    @supplier = User::Supplier.make!
    @supplier.tag_list << "some tag1"
    @supplier.save

    @member = User::Member.make!
    @member.tag_list << "some tag1"
    @member.tag_list << "some tag2"
    @member.save

  end

  context "all tags must mach" do
    it "should return correctly tagged objects like contacts and users" do
      @tag_group.update_attribute(:match_all, true)

      @tag_group.tagged_objects.should include(@contact1)
      @tag_group.tagged_objects.should include(@member)

      @tag_group.tagged_objects.should_not include(@contact2)
      @tag_group.tagged_objects.should_not include(@supplier)
    end
  end

  context "any tags must mach" do
    it "should return correctly tagged objects like contacts and users" do
      @tag_group.update_attribute(:match_all, false)
      @tag_group.reload
      @tagged_objects = @tag_group.tagged_objects
      @tagged_objects.should include(@contact1)
      @tagged_objects.should include(@contact2)
      @tagged_objects.should include(@member)
      @tagged_objects.should include(@supplier)
    end
  end
end