RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end

shared_context 'category supplier signed in' do
  let(:category_supplier) { create(:category_supplier) }
  before do
    Settings.email_verification_for_suppliers = '0'
    create(:email_template, :uniq_id => 'invoice')
    create(:subscription_plan)
    sign_in category_supplier
  end
end

shared_context 'agent signed in' do
  let(:agent) { create(:agent) }
  before { sign_in agent }
end

shared_context 'admin signed in' do
  let(:admin) { create(:admin) }
  before { sign_in admin }
end