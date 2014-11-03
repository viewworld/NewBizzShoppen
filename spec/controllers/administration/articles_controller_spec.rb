require 'spec_helper'

describe Administration::ArticlesController do
  before { create(:locale) }
  include_context 'admin signed in'

  let(:article) { create(:cms_main_page_article) }

  describe '#show' do
    let(:call_request) { get :show, id: article.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#new' do
    let(:call_request) { get :new }
    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:attributes) { attributes_for(:cms_main_page_article) }
    let(:call_request) { post :create, article: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#edit' do
    let (:call_request) { get :edit, id: article.id }
    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:attributes) { attributes_for(:cms_main_page_article) }
    let(:call_request) { put :update, id: article.id, article: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: article.id }
    it_behaves_like 'an action destroying object'
  end
end
