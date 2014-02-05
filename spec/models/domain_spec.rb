require 'spec_helper'

describe Domain do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:site) }
  it { should validate_presence_of(:locale) }

  let(:default_domain) { create(:domain, :default, :english) }
  let(:second_domain) { create(:domain, :danish) }

  context 'class methods' do
    subject { described_class }

    describe '.default' do
      its(:default) { should eq default_domain.name }
    end

    describe '.for_site_and_locale' do
      let(:site) { second_domain.site }
      let(:locale) { second_domain.locale }
      let(:result) { subject.for_site_and_locale(site, locale) }

      it { expect(result).to be_kind_of Domain }
      it { expect(result.name).to eq second_domain.name }

      context 'for unknown locale' do
        let(:site) { default_domain.site }
        let(:locale) { 'pl' }

        it { expect(result.name).to eq default_domain.name }
      end
    end
  end

  describe '#name_for_env' do
    let(:domain) { "#{site}.com" }
    let(:site) { 'fake-domain' }

    before do
      subject.stub(:name => domain, :site => site)
      Rails.stub(:env => ActiveSupport::StringInquirer.new(env))
    end

    context 'for development' do
      let(:env) { 'development' }

      its(:name_for_env) { should eq "#{domain}:3000" }
    end

    context 'for staging' do
      let(:env) { 'staging' }

      its(:name_for_env) { should eq "#{site}.selleo.com" }
    end

    context 'for production' do
      let(:env) { 'production' }

      its(:name_for_env) { should eq "www.#{domain}" }
    end

    context 'default value' do
      let(:env) { 'test' }

      its(:name_for_env) { should eq domain }
    end
  end
end
