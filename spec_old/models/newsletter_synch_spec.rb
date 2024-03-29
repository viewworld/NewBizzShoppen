require 'spec_helper'

describe NewsletterSynch do
  fixtures :all

  before(:each) do
    Delayed::Worker.delay_jobs = true
    @lead_category = LeadCategory.make!
  end

  def lead_subscriber_hash(obj)
    [{
         "EmailAddress" => obj.email_address,
         "Name" => obj.contact_name,
         "CustomFields" => [
             { "Key" => "[CompanyName]", "Value" => obj.company_name, "Clear" => false},
             { "Key" => "[ZipCode]", "Value" => obj.zip_code, "Clear" => false},
             { "Key" => "[LoginKey]", "Value" => nil, "Clear" => false}
         ]
     }]
  end

  def user_subscriber_hash(obj, with_autologin=true)
    custom_fields = [
          { "Key" => "[CompanyName]", "Value" => obj.company_name, "Clear" => false},
          { "Key" => "[ZipCode]", "Value" => obj.address.zip_code, "Clear" => false},
        ]

    custom_fields << { "Key" => "[LoginKey]", "Value" => obj.login_key, "Clear" => false} if with_autologin

    [{
         "EmailAddress" => obj.email,
         "Name" => obj.full_name,
         "CustomFields" => custom_fields
     }]
  end

  #it "should remove subscriber from campaign monitor when object is deleted from sources" do
  it "should export all new subscribers in sources" do
    CreateSend::List.stubs(:create).times(3).returns("List1","List2","List3")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:details).returns(false).then.returns(false).then.returns(false).
        then.returns(Hashie::Mash.new(:ListID => "List1"), Hashie::Mash.new(:ListID => "List2"), Hashie::Mash.new(:ListID => "List3")).
        then.returns(Hashie::Mash.new(:ListID => "List1"), Hashie::Mash.new(:ListID => "List2"), Hashie::Mash.new(:ListID => "List3"))
    CreateSend::List.any_instance.stubs(:active).times(3).returns(Hashie::Mash.new(:RecordsOnThisPage => 0, :Results => []))

    @list_lead_category = NewsletterList.make!
    @list_lead_category.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @lead = Lead.make!(:category => @lead_category)

    @campaign = Campaign.make!
    @list_campaign = NewsletterList.make!
    @list_campaign.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)
    @contact = Contact.make!(:campaign => @campaign)

    @role = Role.find(7)
    @list_role = NewsletterList.make!
    @list_role.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)
    User::Member.delete_all
    @member = User::Member.make!

    CreateSend::Subscriber.expects(:import).with(@list_lead_category.cm_list_id, lead_subscriber_hash(@lead), false)
    CreateSend::Subscriber.expects(:import).with(@list_campaign.cm_list_id, lead_subscriber_hash(@contact), false)
    CreateSend::Subscriber.expects(:import).with(@list_role.cm_list_id, user_subscriber_hash(@member), false)
    Delayed::Worker.new.work_off

    @lead.destroy
    @contact.destroy
    @member.destroy

    CreateSend::List.any_instance.stubs(:active).returns(
        Hashie::Mash.new(:RecordsOnThisPage => 1, :Results => [Hashie::Mash.new(:EmailAddress => @lead.email_address)]),
        Hashie::Mash.new(:RecordsOnThisPage => 1, :Results => [Hashie::Mash.new(:EmailAddress => @contact.email_address)]),
        Hashie::Mash.new(:RecordsOnThisPage => 1, :Results => [Hashie::Mash.new(:EmailAddress => @member.email)])
    )
    CreateSend::Subscriber.any_instance.expects(:delete).times(3)
    NewsletterSynch.process!
  end

  it "should export subscribers when new source is added to existing list" do
    CreateSend::List.stubs(:create).times(1).returns("List1")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:details).returns(false).
        then.returns(Hashie::Mash.new(:ListID => "List1")).
        then.returns(Hashie::Mash.new(:ListID => "List1"))
    CreateSend::List.any_instance.stubs(:active).times(1).returns(Hashie::Mash.new(:RecordsOnThisPage => 0, :Results => []))

    @list = NewsletterList.make!
    @list.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @lead = Lead.make!(:category => @lead_category)

    CreateSend::Subscriber.expects(:import).with(@list.cm_list_id, lead_subscriber_hash(@lead), false)
    Delayed::Worker.new.work_off

    @campaign = Campaign.make!
    @contact = Contact.make!(:campaign => @campaign)
    @list.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)

    CreateSend::List.any_instance.stubs(:active).times(1).returns(
        Hashie::Mash.new(:RecordsOnThisPage => 1, :Results => [Hashie::Mash.new(:EmailAddress => @lead.email_address)])
    )
    CreateSend::Subscriber.expects(:import).with(@list.cm_list_id, lead_subscriber_hash(@contact)+lead_subscriber_hash(@lead), false)
    NewsletterSynch.process!
  end

  it "should not export autologins in custom fields when the owner of the list is a supplier" do
    CreateSend::List.stubs(:create).returns("List1")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:details).returns(false).then.returns(Hashie::Mash.new(:ListID => "List1"))
     CreateSend::List.any_instance.stubs(:active).returns(Hashie::Mash.new(:RecordsOnThisPage => 0, :Results => []))

    @role = Role.find(7)
    @list_role = NewsletterList.make!(:owner => User::Supplier.make!)
    @list_role.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)
    User::Member.delete_all
    @member = User::Member.make!

    CreateSend::Subscriber.expects(:import).with(@list_role.cm_list_id, user_subscriber_hash(@member, false), false)

    Delayed::Worker.new.work_off
  end

end
