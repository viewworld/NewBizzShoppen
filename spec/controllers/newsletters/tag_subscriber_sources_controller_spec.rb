require 'spec_helper'

describe Newsletters::TagSubscriberSourcesController do
  before { create(:locale) }
  include_context 'admin signed in'

  describe '#create' do
    include_context 'email templates for campaign exists'
    let!(:contact) { create(:contact) }
    let!(:call_centre) { contact.campaign.creator }
    let!(:newsletter_list) { create(:newsletter_list, :owner => call_centre) }
    let!(:newsletter_list_subscriber) { create(:newsletter_list_subscriber,
                                               :newsletter_list => newsletter_list,
                                               :subscriber => contact) }
    let(:call_request) { xhr :post,
                             :create,
                             :newsletter_list_id => newsletter_list.id,
                             :newsletter_list_subscriber_tagger => attributes }

    context 'valid attributes' do
      let(:attributes) { {:type => 'add', :tags => 'tag1'} }

      it { expect { call_request }.to change { contact.reload.tag_list }.from([]).to(%w(tag1)) }

      context 'after request' do
        before { call_request }

        it { expect(assigns(:result)).to be_true }
        it { should render_template 'create' }
      end
    end

    context 'invalid attributes' do
      let(:attributes) { {:type => '', :tags => ''} }

      it { expect { call_request }.not_to change { contact.reload.tag_list } }

      context 'after request' do
        before { call_request }

        it { expect(assigns(:result)).to be_false }
        it { should render_template 'create' }
      end
    end
  end
end