require 'spec_helper'

describe Administration::HintsController do
  before { create(:locale) }
  include_context 'admin signed in'
  let(:hint) { create(:cms_hint_article) }

  describe '#index' do
    let(:call_request) { get :index }

    it_behaves_like 'an action rendering view'
  end

  describe '#edit' do
    #FIXME I18n::InvalidPluralizationData using current factories
  end

  describe '#show' do
    #FIXME I18n::InvalidPluralizationData using current factories
  end
end
