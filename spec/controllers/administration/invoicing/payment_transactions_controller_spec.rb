require 'spec_helper'

describe Administration::Invoicing::PaymentTransactionsController do
  before { create(:locale) }
  include_context 'super admin signed in'
  let(:invoice) { create(:invoice) }
  let(:manual_transaction) { create(:manual_transaction) }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action rendering view'
  end

  describe '#new' do
    let(:call_request) { get :new, invoice_id: invoice.id }

    it_behaves_like 'an action rendering view'
  end

  describe '#edit' do
    let(:call_request) { get :edit, id: manual_transaction.id }

    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) do
      { invoice_id: invoice.id, amount: 1, paid_at: DateTime.now }
    end
    let(:call_request) { post :create, manual_transaction: attributes }

    it_behaves_like 'an action creating object' do
      let(:model_class) { ManualTransaction }
    end
  end

  describe '#update' do
    let(:attributes) {  { amount: 2 } }
    let(:call_request) { put :update, id: manual_transaction.id, manual_transaction: attributes }

    it_behaves_like 'an action updating object' do
      let(:model_name) { :manual_transaction }
    end
  end
end
