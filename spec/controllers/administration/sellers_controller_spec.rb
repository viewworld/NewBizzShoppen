require 'spec_helper'

describe Administration::SellersController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:seller) { create(:seller) }
  let(:country) { create(:country) }
  let(:bank_account) { create(:bank_account) }

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:address_attributes) { attributes_for(:address).merge(country_id: country.id )}
    let(:attributes) { attributes_for(:seller, address_attributes: address_attributes, bank_account_id: bank_account.id) }
    let(:call_request) { post :create, seller: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: seller.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:seller) }
    let(:call_request) { put :update, id: seller.id, seller: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    context 'when more sellers than one' do
      let!(:new_seller) { create(:seller) }
      let(:call_request) { delete :destroy, id: new_seller.id }

      it_behaves_like 'an action destroying object'
    end

    context 'when last seller left' do
      let(:call_request) { delete :destroy, id: seller.id }

      it_behaves_like 'an action destroying object', expect_failure: true
    end
  end
end
