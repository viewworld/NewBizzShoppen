require 'spec_helper'

describe Administration::EmailTemplateSignaturesController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:email_template_signature) { create(:email_template_signature) }

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { attributes_for(:email_template_signature) }
    let(:call_request) { post :create, email_template_signature: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: email_template_signature.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:email_template_signature) }
    let(:call_request) { put :update, id: email_template_signature.id, email_template_signature: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: email_template_signature.id }
    it_behaves_like 'an action destroying object'
  end
end
