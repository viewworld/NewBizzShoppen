require 'spec_helper'

describe Administration::SupplierInterestsController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:supplier) { create(:category_supplier) }

  describe '#edit' do
    context 'user has supplier role' do
      let(:call_request) { get :edit, id: supplier.id }

      before do
        Settings.email_verification_for_suppliers = '0'
        create(:email_template, uniq_id: 'invoice')
        create(:subscription_plan)
      end

      it_behaves_like 'an action rendering view'
    end

    context 'user without supplier role' do
      let(:call_request) { get :edit, id: admin.id }

      it_behaves_like 'an action redirecting to', -> { edit_administration_user_path(admin) }
    end
  end

  describe '#update' do
    #FIXME check, fixme in controller. I can't perform this test using using category supplier, and IIRC I failed with creating a factory for a regular supplier
  end
end
