require 'spec_helper'

describe Administration::CurrenciesController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:currency) { create(:currency) }

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { attributes_for(:currency) }
    let(:call_request) { post :create, currency: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: currency.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:currency) }
    let(:call_request) { put :update, id: currency.id, currency: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: currency.id }
    it_behaves_like 'an action destroying object'
  end
end
