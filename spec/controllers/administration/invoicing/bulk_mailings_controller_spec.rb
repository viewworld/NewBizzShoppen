require 'spec_helper'

describe Administration::Invoicing::BulkMailingsController do
  before { create(:locale) }
  include_context 'super admin signed in'
  let(:invoice) { create(:invoice) }

  describe '#edit' do
    context 'invoice_ids are present in params' do
      let(:call_request) { get :edit, invoice_ids: [invoice.id] }

      it_behaves_like 'an action rendering view'
    end

    context 'invoice_ids are blank' do
      let(:call_request) { get :edit }

      it_behaves_like 'an action redirecting to', -> { administration_invoicing_invoices_path }
    end
  end

  describe '#update' do
    #TODO
  end
end
