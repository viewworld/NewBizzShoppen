require 'spec_helper'

describe ArticlesController do
  before { create(:locale) }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action redirecting to', -> { root_path }
  end

  describe '#show' do
    let(:article) { create(:article) }

    context 'articles is not found' do
      let(:call_request) { get :index }

      it_behaves_like 'an action redirecting to', -> { root_path }
    end

    context 'rendering view' do
      let(:call_request) { get :show, { id: article.id }  }

      it_behaves_like 'an action rendering view'
    end

    context 'rendering popup' do
      let(:call_request) { get :show, { id: article.id, popup: true }  }

      it_behaves_like 'an action rendering view'
    end
  end
end
