require 'spec_helper'

describe NewsletterSubscriber do
  fixtures :all

  before(:each) do
    Delayed::Worker.delay_jobs = true
    @time = Time.now

    @list = NewsletterList.make!
  end

  def set_time(t)
    Time.stubs(:now).returns(t)
  end

  def reset_time
    Time.stubs(:now).returns(@time)
  end

  def execute_delayed_jobs
    set_time(Time.now+5.minutes)
    Delayed::Worker.new.work_off
    #puts Delayed::Job.where(:queue => "newsletter_objects_update").first.last_error.inspect
  end

  context "Update & sync" do
    before(:each) do
      @lead_category = LeadCategory.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
      @lead = Lead.make!(:category => @lead_category)
      @lead.newsletter_subscriber.should_not be_nil
      @old_email = @lead.email_address
    end

    it "should NOT update previous email and change synced to false if email was not changed in subscribable object" do
      @new_email = "test#{Time.now.to_i}@nbs1.com"
      @lead.update_attributes!(:email_address => @new_email)

      @lead.newsletter_subscriber.email.should == @new_email
      @lead.newsletter_subscriber.previous_email.should == @old_email
      @lead.newsletter_subscriber.is_synced.should be_false

      @lead.newsletter_subscriber.update_attribute(:is_synced, true)

      #email is updated but it is the same
      @lead.update_attributes!(:email_address => @new_email)

      @lead.newsletter_subscriber.email.should == @new_email
      @lead.newsletter_subscriber.previous_email.should == @old_email
      @lead.newsletter_subscriber.is_synced.should be_true

      #email is updated second time
      @new_email2 = "test2#{Time.now.to_i}@nbs1.com"
      @lead.update_attributes!(:email_address => @new_email2)

      @lead.newsletter_subscriber.email.should == @new_email2
      @lead.newsletter_subscriber.previous_email.should == @new_email
      @lead.newsletter_subscriber.is_synced.should be_false
    end
  end

  context "No source created" do
    it "should NOT create subscriber when object is not connected to any source newsletter" do
      [Lead.make!, Contact.make!, User::Member.make!].each do |object|
        object.newsletter_subscriber.should be_nil
      end
    end
  end

  context "Lead" do
    before(:each) do
      @lead_category = LeadCategory.make!

      @lead_before = Lead.make!(:category => @lead_category)

      @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)

      @lead_category.reload

      @lead = Lead.make!(:category => @lead_category)
    end

    it "should create subscriber when new lead created" do
      @lead.newsletter_subscriber.should_not be_nil
      @lead.newsletter_subscriber.subscribable.should == @lead

      execute_delayed_jobs

      @lead.reload

      @lead.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @lead.newsletter_subscriber.email.should == @lead.email_address
      @lead.newsletter_subscriber.name.should == @lead.contact_name
    end

    it "should update subscriber when lead was updated" do
      @lead.update_attributes!(:email_address => "new_email_1331638434@nbs.com", :contact_name => "Tom Jones")

      execute_delayed_jobs

      @lead.reload

      @lead.newsletter_subscriber.email.should == @lead.email_address
      @lead.newsletter_subscriber.name.should == @lead.contact_name
    end

    it "should be possible to add subscribers from lead source when leads were created before source was added" do
      @lead_before.reload
      @lead_before.newsletter_subscriber.should be_nil

      @list.newsletter_sources.first.assign_existing_subscribable_objects!
      @lead_before.reload
      @lead_before.newsletter_subscriber.should_not be_nil
    end
  end

  context "Campaign" do
    before(:each) do
      @campaign = Campaign.make!

      @contact_before = Contact.make!(:campaign => @campaign)

      @list.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)

      @campaign.reload

      @contact = Contact.make!(:campaign => @campaign)
    end

    it "should create subscriber when new contact created" do
      @contact.newsletter_subscriber.should_not be_nil
      @contact.newsletter_subscriber.subscribable.should == @contact

      execute_delayed_jobs

      @contact.reload

      @contact.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end

    it "should update subscriber when contact was updated" do
      @contact.update_attributes!(:email_address => "new_email_1331638434@nbs.com", :contact_name => "Tom Jones")

      execute_delayed_jobs

      @contact.reload

      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end

    it "should be possible to add subscribers from campaign source when contacts were created before source was added" do
      @contact_before.reload
      @contact_before.newsletter_subscriber.should be_nil

      @list.newsletter_sources.first.assign_existing_subscribable_objects!
      @contact_before.reload
      @contact_before.newsletter_subscriber.should_not be_nil
    end
  end

  context "User role" do
    before(:each) do
      @member_before = User::Member.make!(:first_name => "User0000000001")
      @role = Role.find(4)
      @list.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)

      @member = User::Member.make!
    end

    it "should create subscriber when new user of certain role is created" do
      @member.newsletter_subscriber.should_not be_nil
      @member.newsletter_subscriber.subscribable.should == @member

      execute_delayed_jobs

      @member.reload

      @member.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @member.newsletter_subscriber.email.should == @member.email
      @member.newsletter_subscriber.name.should == @member.full_name
    end

    it "should update subscriber when user was updated" do
      @member.update_attributes!(:email => "new_email_1331638434@nbs.com", :first_name => "Tom")

      execute_delayed_jobs

      @member.reload

      @member.newsletter_subscriber.email.should == @member.email
      @member.newsletter_subscriber.name.should == @member.full_name
    end

    it "should be possible to add subscribers from user role source when users were created before source was added" do
      @member_before.reload
      @member_before.newsletter_subscriber.should be_nil

      @list.newsletter_sources.first.assign_existing_subscribable_objects!

      @member_before.reload
      @member_before.newsletter_subscriber.should_not be_nil
    end
  end

  context "User Subscription Type" do
    before(:each) do
      @payable_subscription = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3, :can_be_upgraded => false)
      @payable_subscription.subscription_plan_lines.make!(:price => 25)
      @payable_subscription.subscription_plan_lines.make!(:price => 5)

      @supplier_before = User::Supplier.make!(:subscription_plan_id => @payable_subscription.id)

      @list.newsletter_sources.create(:source_type => NewsletterSource::SUBSCRIPTION_TYPE_SOURCE, :sourceable => @payable_subscription)

      @payable_subscription.reload

      @supplier = User::Supplier.make!(:subscription_plan_id => @payable_subscription.id)
    end

    it "should create subscriber when new user of certain subscription type is created" do
      @supplier.newsletter_subscriber.should_not be_nil
      @supplier.newsletter_subscriber.subscribable.should == @supplier

      execute_delayed_jobs

      @supplier.reload

      @supplier.newsletter_subscriber.newsletter_sources.first.should == @list.newsletter_sources.first

      @supplier.newsletter_subscriber.email.should == @supplier.email
      @supplier.newsletter_subscriber.name.should == @supplier.full_name
    end

    it "should update subscriber when user was updated" do
      @supplier.update_attributes!(:email => "new_email_1331638434@nbs.com", :first_name => "Tom")

      execute_delayed_jobs
      @supplier.reload

      @supplier.newsletter_subscriber.email.should == @supplier.email
      @supplier.newsletter_subscriber.name.should == @supplier.full_name
    end

    it "should be possible to add subscribers from user subscription type source when users were created before source was added" do
      @supplier_before.reload
      @supplier_before.newsletter_subscriber.should be_nil

      @list.newsletter_sources.first.assign_existing_subscribable_objects!

      @supplier_before.reload
      @supplier_before.newsletter_subscriber.should_not be_nil
    end
  end

  context "Custom" do
    before(:each) do
      @contact = Contact.make!
      @contact.add_to_custom_source_of_newsletter_list!(@list)
      @contact.reload
    end

    it "should create subscriber when object was added to custom source of the list" do
      @contact.newsletter_subscriber.should_not be_nil
      @contact.newsletter_subscriber.newsletter_sources.first.should be_custom_source
      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end

    it "should update object added to custom source of the list" do
      @contact.update_attributes!(:email_address => "new_email_1331638434@nbs.com", :contact_name => "Tom Jones")

      execute_delayed_jobs

      @contact.reload

      @contact.newsletter_subscriber.email.should == @contact.email_address
      @contact.newsletter_subscriber.name.should == @contact.contact_name
    end
  end

  context "Tags" do
    before(:each) do
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

      it "should create newsletter subscriber to all objects that are tagged with tag1 OR tag2" do
        [@contact1, @contact2, @member1, @member2].each do |object|
          object.reload

          object.newsletter_subscriber.should_not be_nil
        end
        @supplier1.newsletter_subscriber.should be_nil
      end

      it "should be possible to add subscribers from objects tagged with tag1 OR tag2 before the source was added" do
        [@contact_before, @member_before].each do |object|
          object.reload
          object.newsletter_subscriber.should be_nil
        end

        @list.newsletter_sources.first.assign_existing_subscribable_objects!

        [@contact_before, @member_before].each do |object|
          object.reload
          object.newsletter_subscriber.should_not be_nil
        end
      end
    end

    context "match all" do
      before(:each) do
        @tag_group.update_attribute(:match_all, true)
        generate_objects_with_tags
      end

      it "should create newsletter subscriber to all objects that are tagged with tag1 AND tag2" do
        [@contact1, @member1].each do |object|
          object.reload

          object.newsletter_subscriber.should_not be_nil
        end

        [@contact2, @member2, @supplier1].each do |object|
          object.reload

          object.newsletter_subscriber.should be_nil
        end
      end

      it "should be possible to add subscribers from objects tagged with tag1 AND tag2 before the source was added" do
        [@contact_before, @member_before].each do |object|
          object.reload
          object.newsletter_subscriber.should be_nil
        end

        @list.newsletter_sources.first.assign_existing_subscribable_objects!

        @contact_before.reload
        @contact_before.newsletter_subscriber.should_not be_nil

        @member_before.reload
        @member_before.newsletter_subscriber.should be_nil
      end
    end
  end

  context "New source added to list" do
    it "should add new sources to existing subscriber of the object when other list request it through the sources of the same type/sourceable object" do
      @lead_category = LeadCategory.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
      @lead = Lead.make!(:category => @lead_category)

      @lead.newsletter_subscriber.should_not be_nil
      @lead.newsletter_subscriber.newsletter_sources.size.should == 1

      @other_list = NewsletterList.make!
      @other_list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
      @other_list.newsletter_sources.first.assign_existing_subscribable_objects!

      @lead.reload
      @lead.newsletter_subscriber.newsletter_sources.size.should == 2

      @lead_category.reload
      @lead_category.newsletter_sources.size.should == 2

      #every newly created subscribable object should have two sources
      @new_lead = Lead.make!(:category => @lead_category)
      @new_lead.reload
      @new_lead.newsletter_subscriber.newsletter_sources.size.should == 2
    end

    it "should add new sources to existing subscriber of the object when other list request it through the sources of different type/sourceable object (tags and something else)" do
      @campaign = Campaign.make!
      @list.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)

      @contact = Contact.make!(:campaign => @campaign, :header => "Contact A")
      @contact.tag_list << "some tag1"
      @contact.save

      @contact.newsletter_subscriber.should_not be_nil
      @contact.newsletter_subscriber.newsletter_sources.size.should == 1

      @other_list = NewsletterList.make!
      @tag_group = TagGroup.create(:match_all => false)
      @tag_group.tag_list << "some tag1"
      @tag_group.tag_list << "some tag2"
      @tag_group.save
      @other_list.newsletter_sources.create(:source_type => NewsletterSource::TAG_SOURCE, :sourceable => @tag_group)
      @other_list.newsletter_sources.first.assign_existing_subscribable_objects!

      @tag_group.reload

      @contact.reload
      @contact.newsletter_subscriber.newsletter_sources.size.should == 2

      @new_contact = Contact.make!(:campaign => @campaign, :header => "Contact B")
      @new_contact.tag_list << "some tag1"
      @new_contact.tag_list << "some tag2"
      @new_contact.save
      @new_contact.reload

      @new_contact.send(:update_newsletter_subscriber)
      @new_contact.reload
      @new_contact.newsletter_subscriber.newsletter_sources.size.should == 2
    end
  end
end