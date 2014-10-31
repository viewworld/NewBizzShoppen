require 'spec_helper'

describe Administration::YoutubeIntroductionsController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:youtube_introduction) { create(:youtube_introduction) }

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { attributes_for(:youtube_introduction) }
    let(:call_request) { post :create, youtube_introduction: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: youtube_introduction.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:youtube_introduction) }
    let(:call_request) { put :update, id: youtube_introduction.id, youtube_introduction: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: youtube_introduction.id }

    it_behaves_like 'an action destroying object', -> { administration_settings_path }
  end
end
