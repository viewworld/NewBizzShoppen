require 'spec_helper'

describe Administration::Invoicing::InvoicesController do
  before { create(:locale) }
  include_context 'super admin signed in'
  let(:invoice) { create(:invoice) }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action rendering view'
  end

  describe '#show' do
    let(:call_request) { get :show, id: invoice.id }

    it_behaves_like 'an action rendering view'
  end

  describe '#edit' do
    let(:call_request) { get :edit, id: invoice.id }

    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) do
      { user_id: create(:agent).id, seller_id: create(:seller).id, bank_account_id: create(:bank_account).id, currency_id: create(:currency).id }
    end
    let(:call_request) { post :create, invoice: attributes }

    it_behaves_like 'an action creating object' do
      let(:model_class) { Invoice }
    end
  end

  describe '#update' do
    let(:attributes) { { seller_first_name: 'Fair' } }
    let(:call_request) { put :update, id: invoice.id, invoice: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: invoice.id }

    it_behaves_like 'an action destroying object'
  end
end
