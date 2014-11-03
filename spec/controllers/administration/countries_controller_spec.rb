require 'spec_helper'

describe Administration::CountriesController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:country) { create(:country) }

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { attributes_for(:country, email_template_signature_attributes: attributes_for(:email_template_signature)) }
    let(:call_request) { post :create, country: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: country.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:country) }
    let(:call_request) { put :update, id: country.id, country: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: country.id }
    it_behaves_like 'an action destroying object'
  end
end
