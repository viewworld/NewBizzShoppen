shared_context 'email templates for campaign exists' do
  before do
    Campaign::CLONED_TEMPLATES.each_pair do |_, email_template_uniq_id|
      FactoryGirl.create(:email_template, :uniq_id => email_template_uniq_id)
    end
  end
end
