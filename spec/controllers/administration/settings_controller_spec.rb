require 'spec_helper'

describe Administration::SettingsController do
  before { create(:locale) }
  include_context 'admin signed in'

  describe '#edit' do
    let(:call_request) { get :edit }

    it_behaves_like 'an action rendering view'
  end

  describe '#update' do
    let(:setting) { create(:setting) }
    let(:call_request) { put :update, { settings: { setting.id => 100 } } }

    it_behaves_like 'an action redirecting to', -> { edit_administration_setting_path }
  end
end
