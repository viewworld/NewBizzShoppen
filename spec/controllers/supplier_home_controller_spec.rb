require 'spec_helper'

describe SupplierHomeController do
  before { create(:locale) }

  describe '#show' do
    context '#supplier' do
      include_context 'lead supplier signed in'

      let(:call_request) { get :show }

      it_behaves_like 'an action rendering view'
    end

    context '#guest' do
      let(:call_request) { get :show }

      it_behaves_like 'an action rendering view'
    end
  end
end
