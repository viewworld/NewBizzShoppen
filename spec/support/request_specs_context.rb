shared_context 'request specs context' do
  before do
    Settings.big_supplier_purchase_limit = 10000
    with_site('fairleads')
    Locale.make!
    VatRate.make!
    without_confirmation_email!
    without_invoice_email_template!
    without_lead_notification!
    admin.roles << :superadmin
    admin.save!
  end

  let(:admin) { User::Admin.make!(:confirmed_at => Time.now) }
  let(:seller) { Seller.make! }
  let(:company_name) { 'CompanyName' }
  let(:lead_category) { LeadCategory.find_by_name(company_name) }
  let!(:currency) { Currency.make!(:name => 'EUR', :global_default => true) }
  let(:country) { Country.first }
end
