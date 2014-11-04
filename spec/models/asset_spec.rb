require 'spec_helper'

describe Asset do

  describe '.s3_storage?' do
    before { Rails.stub(env: env) }
    let(:perform) { described_class.s3_storage? }

    context 'use s3 on production' do
      let(:env) { 'production' }

      it { expect(perform).to be_true }
    end

    context 'use s3 on staging' do
      let(:env) { 'staging' }

      it { expect(perform).to be_true }
    end

    context 'use s3 on development' do
      let(:env) { 'development' }

      it { expect(perform).to be_true }
    end

    context 'do not use s3 on test' do
      let(:env) { 'test' }

      it { expect(perform).to be_false }
    end
  end

  describe '.attachment_options' do
    before { described_class.stub(s3_storage?: s3_storage) }
    let(:perform) { described_class.attachment_options }

    context 'with s3 storage' do
      let(:s3_storage) { true }

      it { expect(perform.keys).to eq [:storage, :s3_protocol, :s3_credentials, :s3_permissions, :path] }
      it { expect(perform.values).to eq [:s3, 'https', "#{Rails.root}/config/s3.yml", :public_read, 'assets/:id/:style/:basename.:extension'] }
    end

    context 'with local storage' do
      let(:s3_storage) { false }

      it { expect(perform.keys).to eq [:url, :path] }
      it { expect(perform.values).to eq ['/system/assets/:id/:style/:basename.:extension', ':rails_root/public/system/assets/:id/:style/:basename.:extension'] }
    end
  end

  context 'associations' do
    it { should belong_to :user }
    it { should belong_to(:assetable).with_foreign_key :assetable_id }
    it { expect(subject.data).to be_kind_of Paperclip::Attachment }
  end

  it { should delegate_method(:url).to :data }

  describe '#format_created_at' do
    before { subject.stub(created_at: Time.parse('11.10.2014 13:14:15')) }

    it { expect(subject.format_created_at).to eq '11.10.2014 13:14' }
  end

  describe '#url' do
    let(:perform) { subject.url }

    it { expect(perform).to eq '/data/original/missing.png' }
  end
end
