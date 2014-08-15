require 'spec_helper'

describe NewsletterListSubscriber do
  describe 'CSV_ATTRS constant' do
    let(:value) { %w(company_name company_phone_number company_website address_line_1 address_line_2 address_line_3 zip_code country region company_vat_no company_ean_number contact_name contact_title note direct_phone_number phone_number email_address linkedin_url facebook_url pnumber nnmid custom_1 custom_2 custom_3 custom_4 custom_5) }
    it { expect(described_class::CSV_ATTRS).to eq value }
  end
end
