require 'spec_helper'

describe NewsletterSource do
  fixtures :all

  before(:each) do
    Delayed::Worker.delay_jobs = true
  end

  context "Update & sync" do
    it "should remove old subcriber and create new when email address changes" do
      CreateSend::List.any_instance.stubs(:details).returns(false)
      CreateSend::List.stubs(:create).returns("List1023456")
      @lead = Lead.make!(:category => @lead_category)
      CreateSend::List.any_instance.stubs(:active).
          returns(Hashie::Mash.new(:RecordsOnThisPage => 0, :Results => [])).then.
          returns(Hashie::Mash.new(:RecordsOnThisPage => 1, :Results => [{:EmailAddress => @lead.email_address}]))
      CreateSend::Subscriber.stubs(:import).twice()
      @list = NewsletterList.make
      @list.newsletter_sources.build(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
      @list.save
      Delayed::Worker.new.work_off
      CreateSend::Subscriber.expects(:new).once().with(@list.cm_list_id, @lead.email_address)
      @lead.update_attribute(:email_address, "new@email.addr")
      @list.newsletter_synches.create
    end
  end

  context "Lead" do
    before(:each) do
      @list = NewsletterList.make!
      @lead_category = LeadCategory.make!
      @lead_before = Lead.make!(:category => @lead_category)
      @newsletter_source = @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
      @lead_category.reload
      @lead = Lead.make!(:category => @lead_category)
    end

    it "should contain subscriber in source when new lead created" do
      @list.newsletter_subscribers.map(&:subscriber).should include(@lead)
    end
  end

  context "Campaign" do
    before(:each) do
      @list = NewsletterList.make!
      @campaign = Campaign.make!
      @contact_before = Contact.make!(:campaign => @campaign)
      @list.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)
      @campaign.reload
      @contact = Contact.make!(:campaign => @campaign)
    end

    it "should contain subscriber in source when new contact created" do
      @list.newsletter_subscribers.map(&:subscriber).should include(@contact)
    end
  end

  context "User role" do
    before(:each) do
      @list = NewsletterList.make!
      @member_before = User::Member.make!(:first_name => "User0000000001")
      @role = Role.find(7)
      @list.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)
      @member = User::Member.make!
    end

    it "should contain subscriber in source when new user of certain role is created" do
      @list.newsletter_subscribers.map(&:subscriber).map(&:with_role).should include(@member)
    end
  end

  context "User Subscription Type" do
    before(:each) do
      @list = NewsletterList.make!
      @payable_subscription = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3, :can_be_upgraded => false)
      @payable_subscription.subscription_plan_lines.make!(:price => 25)
      @payable_subscription.subscription_plan_lines.make!(:price => 5)
      @supplier_before = User::Supplier.make!(:subscription_plan_id => @payable_subscription.id)
      @list.newsletter_sources.create(:source_type => NewsletterSource::SUBSCRIPTION_TYPE_SOURCE, :sourceable => @payable_subscription)
      @payable_subscription.reload
      @supplier = User::Supplier.make!(:subscription_plan_id => @payable_subscription.id)
    end

    it "should contain subscriber in source when new user of certain subscription type is created" do
      @list.newsletter_subscribers.map(&:subscriber).map(&:with_role).should include(@supplier)
    end
  end

  context "Custom" do
    before(:each) do
      @list = NewsletterList.make!
      @contact = Contact.make!
      @user = User::Member.make!
      @lead = Lead.make!
      @list.add_to_custom_sources!([@contact, @user, @lead])
    end

    it "should contain subscriber in source when object was added to custom source of the list" do
      [@contact, @user, @lead].each do |object|
        @list.newsletter_sources.detect{ |ns| ns.sourceable == object and ns.source_type == NewsletterSource::CUSTOM_SOURCE }.should_not be_nil
        object = User.find(object.id) if object.is_a?(User)
        @list.newsletter_subscribers.map(&:subscriber).should include(object)
      end
    end
  end

  context "Tags" do
    before(:each) do
      @list = NewsletterList.make!

      @contact_before = Contact.make!
      @contact_before.tag_list << "some tag1"
      @contact_before.tag_list << "some tag2"
      @contact_before.save

      @member_before = User::Member.make!
      @member_before.tag_list << "some tag1"
      @member_before.save

      @tag_group = TagGroup.create(:match_all => false)
      @tag_group.tag_list << "some tag1"
      @tag_group.tag_list << "some tag2"
      @tag_group.save

      @list.newsletter_sources.create(:source_type => NewsletterSource::TAG_SOURCE, :sourceable => @tag_group)
    end

    def generate_objects_with_tags
      @contact1 = Contact.make!
      @contact1.tag_list << "some tag1"
      @contact1.tag_list << "some tag2"
      @contact1.save

      @contact2 = Contact.make!
      @contact2.tag_list << "some tag1"
      @contact2.save

      @member1 = User::Member.make!
      @member1.tag_list << "some tag1"
      @member1.tag_list << "some tag2"
      @member1.save

      @member2 = User::Member.make!
      @member2.tag_list << "some tag2"
      @member2.save

      #tag that is not included in any way in the source
      @supplier1 = User::Member.make!
      @supplier1.tag_list << "some tag3"
      @supplier1.save
    end

    context "match any" do
      before(:each) do
        generate_objects_with_tags
      end

      it "should contain newsletter subscriber to all objects that are tagged with tag1 OR tag2" do
        @subscribers = @list.newsletter_subscribers.map(&:subscriber)
        @subscribers.size.should == 6
        @subscribers.should include(@contact1, @contact2, @member1.without_role, @member2.without_role, @contact_before, @member_before.without_role)
        @subscribers.should_not include(@supplier1.without_role)
      end
    end

    context "match all" do
      before(:each) do
        @tag_group.update_attribute(:match_all, true)
        generate_objects_with_tags
      end

      it "should contain newsletter subscriber to all objects that are tagged with tag1 AND tag2" do
        @subscribers = @list.newsletter_subscribers.map(&:subscriber)
        @subscribers.size.should == 3
        @subscribers.should include(@contact1, @member1.without_role, @contact_before)
        @subscribers.should_not include(@contact2, @member2.without_role, @supplier1.without_role)
      end
    end
  end

  context "New source added to list" do
    before(:each) do
      @list = NewsletterList.make!
    end

    it "should add new sources to existing subscriber of the object when other list request it through the sources of the same type/sourceable object" do
      @lead_category = LeadCategory.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
      @lead = Lead.make!(:category => @lead_category)

      @list.newsletter_subscribers.map(&:subscriber).should include(@lead)

      @other_list = NewsletterList.make!
      @other_list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)

      @other_list.newsletter_subscribers.map(&:subscriber).should include(@lead)

      #every newly created subscribable object should have two sources
      @new_lead = Lead.make!(:category => @lead_category)

      @list.newsletter_subscribers.all.map(&:subscriber).should include(@lead,@new_lead)
      @other_list.newsletter_subscribers.all.map(&:subscriber).should include(@lead,@new_lead)
    end

    it "should add new sources to existing subscriber of the object when other list request it through the sources of different type/sourceable object (tags and something else)" do
      @campaign = Campaign.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)

      @contact = Contact.make!(:campaign => @campaign, :header => "Contact A")
      @contact.tag_list << "some tag1"
      @contact.save

      @list.newsletter_subscribers.map(&:subscriber).size.should == 1
      @list.newsletter_subscribers.map(&:subscriber).should include(@contact)

      @other_list = NewsletterList.make!
      @tag_group = TagGroup.create(:match_all => false)
      @tag_group.tag_list << "some tag1"
      @tag_group.tag_list << "some tag2"
      @tag_group.save
      @other_list.newsletter_sources.create(:source_type => NewsletterSource::TAG_SOURCE, :sourceable => @tag_group)

      @other_list.newsletter_subscribers.map(&:subscriber).size.should == 1
      @other_list.newsletter_subscribers.map(&:subscriber).should include(@contact)

      @new_contact = Contact.make!(:campaign => @campaign, :header => "Contact B")
      @new_contact.tag_list << "some tag1"
      @new_contact.tag_list << "some tag2"
      @new_contact.save
    end
  end
end