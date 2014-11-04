require 'spec_helper'

describe Asset::YoutubeImage do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:youtube_introduction).with_foreign_key :assetable_id }

  context 'image has defined extra styles' do
    let(:options) { subject.data.options }
    it { expect(options[:styles]).to eq(thumb: '350>x200') }
  end

  describe '.attachment_options' do
    before { described_class.stub(s3_storage?: true) }
    let(:perform) { described_class.attachment_options }

    context 'with s3 storage' do
      it { expect(perform.values).to eq [:s3, 'https', "#{Rails.root}/config/s3.yml", :private, 'assets/:id/:style/:basename.:extension'] }
    end
  end
end
