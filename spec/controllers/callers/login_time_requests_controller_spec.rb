require 'spec_helper'

describe Callers::LoginTimeRequestsController do
  before { create(:locale) }

  include_context 'agent signed in'

  describe '#new' do
    let(:call_request) { get :new }

    context 'after request' do
      before { call_request }

      it { expect(assigns(:login_time_request)).to be_a_new LoginTimeRequest }
      it { should render_template 'new' }
    end
  end

  describe '#create' do
    include_context 'email templates for campaign exists'
    let!(:campaign) { create(:campaign) }
    let(:call_request) { post :create, :login_time_request => attributes }

    context 'valid attributes' do
      context 'whole day off' do
        let(:attributes) { {:campaign_id => campaign.id,
                            :creator_id => agent.id,
                            :end_time => '20-02-2014 13:04',
                            :user_id => agent.id,
                            :start_time => '20-02-2014 12:04',
                            :whole_day => '0'} }


        it { expect { call_request }.to change { LoginTimeRequest.count }.from(0).to(1) }

        context 'after request' do
          before { call_request }

          it { should redirect_to callers_login_time_requests_path }
        end
      end

      context 'whole day on' do
        let(:attributes) { {:campaign_id => campaign.id,
                            :creator_id => agent.id,
                            :user_id => agent.id,
                            :whole_day => '1',
                            :whole_day_end_date => '21-02-2014',
                            :whole_day_end_time => '15:24',
                            :whole_day_start_date => '20-02-2014',
                            :whole_day_start_time => '08:00'} }

        it { expect { call_request }.to change { LoginTimeRequest.count }.from(0).to(2) }

        context 'after request' do
          before { call_request }

          it { should redirect_to callers_login_time_requests_path }
        end
      end
    end

    context 'invalid attributes' do
      context 'whole day off' do
        let(:attributes) { {:campaign_id => campaign.id,
                            :creator_id => agent.id,
                            :end_time => '20-02-2014 11:04',
                            :user_id => agent.id,
                            :start_time => '20-02-2014 12:04',
                            :whole_day => '0'} }

        it { expect { call_request }.not_to change { LoginTimeRequest.count } }

        context 'after request' do
          before { call_request }

          it { should render_template 'new' }
        end
      end

      context 'whole day on' do
        let(:attributes) { {:campaign_id => campaign.id,
                            :creator_id => agent.id,
                            :user_id => agent.id,
                            :whole_day => '1',
                            :whole_day_end_date => '21-02-2014',
                            :whole_day_end_time => '07:24',
                            :whole_day_start_date => '20-02-2014',
                            :whole_day_start_time => '08:00'}  }

        it { expect { call_request }.not_to change { LoginTimeRequest.count } }

        context 'after request' do
          before { call_request }

          it { should render_template 'new' }
        end
      end
    end
  end
end