require 'spec_helper'

describe NewsletterSynch do
  fixtures :all

  before(:each) do
    Delayed::Worker.delay_jobs = true
    @lead_category = LeadCategory.make!
  end

  it "should export all new subscribers in sources" do
    CreateSend::List.stubs(:create).times(3).returns("List1","List2","List3")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    CreateSend::List.any_instance.stubs(:details).returns(false).then.returns(false).then.returns(false).then.returns(Hashie::Mash.new(:ListID => "List1"), Hashie::Mash.new(:ListID => "List2"), Hashie::Mash.new(:ListID => "List3"))

    @list_lead_category = NewsletterList.make!
    @list_lead_category.newsletter_sources.create(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)

    @campaign = Campaign.make!
    @list_campaign = NewsletterList.make!
    @list_campaign.newsletter_sources.create(:source_type => NewsletterSource::CAMPAIGN_SOURCE, :sourceable => @campaign)

    @role = Role.find(4)
    @list_role = NewsletterList.make!
    @list_role.newsletter_sources.create(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => @role)

    @lead = Lead.make!(:category => @lead_category)
    CreateSend::Subscriber.stubs(:add).with(@list_lead_category.cm_list_id, @lead.email_address, @lead.contact_name, [], true).once

    @contact = Contact.make!(:campaign => @campaign)
    CreateSend::Subscriber.stubs(:add).with(@list_campaign.cm_list_id, @contact.email_address, @contact.contact_name, [], true).once

    @member = User::Member.make!
    CreateSend::Subscriber.stubs(:add).with(@list_role.cm_list_id, @member.email, @member.full_name, [], true).once

    Delayed::Worker.new.work_off
  end

  it "should remove subscriber from campaign monitor when object is deleted from sources" do
    CreateSend::List.any_instance.stubs(:details).returns(false)
    CreateSend::List.stubs(:create).returns("List1023456")
    CreateSend::List.any_instance.stubs(:create_custom_field).returns(true)
    @lead = Lead.make!(:category => @lead_category)
    CreateSend::List.any_instance.stubs(:active).returns(Hashie::Mash.new(:RecordsOnThisPage => 0, :Results => [])).then.returns(Hashie::Mash.new(:RecordsOnThisPage => 1, :Results => [{:EmailAddress => @lead.email_address}]))
    CreateSend::Subscriber.stubs(:import).twice()
    @list = NewsletterList.make
    @list.newsletter_sources.build(:source_type => NewsletterSource::LEAD_CATEGORY_SOURCE, :sourceable => @lead_category)
    @list.save
    Delayed::Worker.new.work_off
    @lead.destroy
    CreateSend::Subscriber.any_instance.stubs(:delete).once()
    @list.newsletter_synches.create
  end

end
