require 'spec_helper'

describe Administration::HomesController do
  before { create(:locale) }
  include_context 'admin signed in'

  describe '#show' do
   let(:call_request) { get :show }

   it_behaves_like 'an action rendering view'
  end
end
