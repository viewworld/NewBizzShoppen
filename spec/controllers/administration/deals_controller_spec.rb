require 'spec_helper'

describe Administration::DealsController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:deal) { create(:deal, creator: admin, email_address: admin.email) }
  let!(:global_email_template) { create(:global_email_template, uniq_id: 'deal_request_details') }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action rendering view'
  end

  describe '#edit' do
    let(:call_request) { get :edit, { id: deal.id } }

    it_behaves_like 'an action rendering view'
  end

  describe '#new' do
    let(:call_request) { get :new }

    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { { header: 'test2' } }
    let(:call_request) { put :update, id: deal.id, deal: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#create' do
    let(:attributes) do
      { start_date: DateTime.now,
        end_date: DateTime.now,
        email_address: admin.email,
        deal_price: 1,
        discounted_price: 1,
        created_leads: 1,
        header: 'test',
        company_name: 'test',
        contact_name: 'test',
        phone_number: 333333333,
        country_id: create(:country).id,
        currency_id: create(:currency).id,
        address_line_1: 'test',
        address_line_3: 'test',
        zip_code: 'test',
        creator_id: create(:agent).id,
        validate_contact_email: false,
        notify_suppliers_after_update: false }
    end

    let(:call_request) { post :create, deal: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: deal.id }

    it_behaves_like 'an action destroying object'
  end
end
