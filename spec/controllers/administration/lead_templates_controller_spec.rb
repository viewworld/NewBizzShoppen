require 'spec_helper'

describe Administration::LeadTemplatesController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:lead_category) { create(:lead_category) }
  let(:lead_template) { create(:lead_template) }

  describe '#new' do
    let(:call_request) { get :new, { category_id: lead_category.id } }

    it_behaves_like 'an action rendering view'
  end

  describe '#edit' do
    let(:call_request) { get :edit, { id: lead_template.id } }

    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { { category_id: lead_category.id, name: 'test' } }
    let(:call_request) { post :create, lead_template: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#update' do

    let(:attributes) { { category_id: lead_category.id, name: 'test' } }
    let(:call_request) { put :update, id: lead_template.id, lead_template: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    context '#different creator' do
      let(:call_request) { delete :destroy, id: lead_template.id }

      it_behaves_like 'an action redirecting to back'
    end

    context '#equal creator' do
      let(:lead_template) { create(:lead_template, creator: admin) }

      let(:call_request) { delete :destroy, id: lead_template.id }

      it_behaves_like 'an action destroying object'
    end
  end
end
