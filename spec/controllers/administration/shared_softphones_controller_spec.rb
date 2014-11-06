require 'spec_helper'

describe Administration::SharedSoftphonesController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:softphone) { create(:softphone) }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action rendering view'
  end

  describe '#new' do
    let(:call_request) { get :new }

    it_behaves_like 'an action rendering view'
  end

  describe '#edit' do
    let(:call_request) { get :edit, { id: softphone.id } }

    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { { name: 'test' } }
    let(:call_request) { post :create, softphone: attributes }

    it_behaves_like 'an action creating object' do
      let(:model_class) { Softphone }
    end
  end

  describe '#update' do
    let(:attributes) { { name: 'test' } }
    let(:call_request) { put :update, id: softphone.id, softphone: attributes }

    it_behaves_like 'an action updating object' do
      let(:model_name) { :softphone }
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: softphone.id }

    it_behaves_like 'an action destroying object' do
      let(:model_name) { :softphone }
    end
  end
end
