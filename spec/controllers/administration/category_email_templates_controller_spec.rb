require 'spec_helper'

describe Administration::CategoryEmailTemplatesController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:email_template) { create(:email_template, resource: create(:lead_category) ) }

  describe '#edit' do
   let(:call_request) { get :edit, { id: email_template.id } }

   it_behaves_like 'an action rendering view'
  end

  describe '#update' do
     let(:attributes) { {name: 'some other name'} }
     let(:call_request) { put :update, { id: email_template.id, email_template: attributes } }

     it_behaves_like 'an action updating object'  do
       let(:model_name) { :email_template }
     end
  end
end
