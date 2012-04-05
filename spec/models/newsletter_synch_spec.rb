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
             { "Key" => "[ZipCode]", "Value" => obj.zip_code, "Clear" => false}
         ]
     }]
  end

  def user_subscriber_hash(obj)
    [{
         "EmailAddress" => obj.email,
         "Name" => obj.full_name,
         "CustomFields" => [
             { "Key" => "[CompanyName]", "Value" => obj.company_name, "Clear" => false},
             { "Key" => "[ZipCode]", "Value" => obj.address.zip_code, "Clear" => false}
         ]
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

end
