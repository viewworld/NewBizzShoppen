require 'spec_helper'

describe Administration::SoftphoneServersController do
  include_context 'admin signed in'

  let(:softphone_server) { create(:softphone_server) }

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { attributes_for(:softphone_server) }
    let(:call_request) { post :create, softphone_server: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: softphone_server.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:softphone_server) }
    let(:call_request) { put :update, id: softphone_server.id, softphone_server: attributes }

    it_behaves_like 'an action updating object'
  end
end
