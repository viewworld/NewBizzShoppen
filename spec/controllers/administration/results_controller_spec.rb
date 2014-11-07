require 'spec_helper'

describe Administration::ResultsController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:result) { create(:result) }

  describe '#edit' do
    let (:call_request) { get :edit, id: result.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:result) }
    let(:call_request) { put :update, id: result.id, result: attributes }

    it_behaves_like 'an action updating object'
  end
end
