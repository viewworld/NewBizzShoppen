shared_context 'newsletter list subscriber exists' do
  include_context 'email templates for campaign exists'
  before { create(:email_template, :uniq_id => 'newsletter_subscriber_sources_tagging') }
  let!(:contact) { create(:contact) }
  let!(:call_centre) { contact.campaign.creator }
  let!(:newsletter_list) { create(:newsletter_list, :owner => call_centre) }
  let!(:newsletter_list_subscriber) { create(:newsletter_list_subscriber,
                                             :newsletter_list => newsletter_list,
                                             :subscriber => contact) }
end
