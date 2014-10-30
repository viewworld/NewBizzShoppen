require 'spec_helper'

describe Administration::VatRatesController do
  include_context 'admin signed in'

  let(:vat_rate) { create(:vat_rate) }

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { attributes_for(:vat_rate).merge(country_attributes: attributes_for(:country)) }
    let(:call_request) { post :create, vat_rate: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: vat_rate.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:vat_rate) }
    let(:call_request) { put :update, id: vat_rate.id, vat_rate: attributes }

    it_behaves_like 'an action updating object'
  end
end
