require 'spec_helper'

describe Administration::Invoicing::CashFlowController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:invoice) { create(:invoice) }

  describe '#new' do
    #FIXME problem with routes
  end

  describe '#create' do
    #FIXME problem with routes
  end
end
