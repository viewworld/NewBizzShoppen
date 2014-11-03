require 'spec_helper'

describe Administration::NewsController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:news) { create(:news) }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action rendering view'
  end

  describe '#new' do
    let(:call_request) { get :new }

    it_behaves_like 'an action rendering view'
  end

  describe '#create' do
    let(:params) do
      { subclass: 'Agent', article: attributes }
    end
    let(:attributes) { { title: 'test', content: 'test test', published: 1 } }
    let(:call_request) { post :create, params }

    it_behaves_like 'an action creating object' do
      let(:model_class) { Article::News::Agent }
    end
  end

  describe '#update' do
    let(:call_request) { put :update, id: news.id, article: attributes }
    let(:attributes) { { title: 'test', content: 'test test', published: 1 } }

    it_behaves_like 'an action updating object' do
       let(:model_name) { :news }
    end
  end

  describe '#destroy' do
    let(:call_request) { delete :destroy, id: news.id }

    it_behaves_like 'an action destroying object'
  end
end
