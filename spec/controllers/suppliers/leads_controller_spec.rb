require 'spec_helper'

describe Suppliers::LeadsController do
  before { create(:locale) }
  include_context 'category supplier signed in'

  describe '#new' do
    let(:call_request) { get :new }

    context 'after request' do
      before { call_request }

      it { expect(assigns(:lead)).to be_a_new Lead }
      it { should render_template 'new' }
    end
  end

  describe '#create' do
    before { Settings.default_lead_creator_email = create(:agent).email }
    let(:call_request) { post :create, :lead => attributes }

    context 'valid attributes' do
      let(:attributes) { {:email_address => '',
                          :published => 'false',
                          :contact_name => 'test',
                          :category_is_changed => '0',
                          :category_id => category_supplier.categories.first.id,
                          :phone_number => '123123123',
                          :address_line_3 => 'test',
                          :address_line_1 => 'test',
                          :company_name => 'test',
                          :description => 'test',
                          :header => 'test',
                          :is_international => '0',
                          :zip_code => 'test'} }

      it { expect { call_request }.to change { Lead.count }.by(1) }
      it { expect { call_request }.to change { LeadPurchase.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { should redirect_to suppliers_lead_purchases_path }
      end
    end

    context 'invalid attributes' do
      let(:attributes) { {} }

      it { expect { call_request }.not_to change { Lead.count } }
      it { expect { call_request }.not_to change { LeadPurchase.count } }

      context 'after request' do
        before { call_request }

        it { should render_template 'new' }
      end
    end
  end
end