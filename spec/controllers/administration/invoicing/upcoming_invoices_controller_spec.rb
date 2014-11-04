require 'spec_helper'

describe Administration::Invoicing::UpcomingInvoicesController do
  before { create(:locale) }
  include_context 'super admin signed in'
  let(:invoice) { create(:invoice) }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action rendering view'
  end
end
