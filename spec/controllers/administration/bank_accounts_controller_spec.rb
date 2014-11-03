require 'spec_helper'

describe Administration::BankAccountsController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:bank_account) { create(:bank_account) }
  let(:country) { create(:country) }

  describe '#new' do
    let(:call_request) { get :new }
    
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:address_attributes) { attributes_for(:address, country_id: country.id) }
    let(:attributes) { attributes_for(:bank_account, address_attributes: address_attributes) }
    let(:call_request) { post :create, bank_account: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: bank_account.id }
    
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:bank_account) }
    let(:call_request) { put :update, id: bank_account.id, bank_account: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: bank_account.id }
    
    it_behaves_like 'an action destroying object'
  end
end
