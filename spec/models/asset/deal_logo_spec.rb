require 'spec_helper'

describe Asset::DealLogo do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:deal).with_foreign_key(:assetable_id).touch true }
  it { should validate_attachment_content_type(:data).
       allowing(*Asset::IMAGE_FILE_TYPES).
       rejecting(*Asset::DOCUMENT_FILE_TYPES) }

  context 'image has defined extra styles' do
    let(:options) { subject.data.options }
    it { expect(options[:styles]).to eq(original: '600x600>', medium: '80x120', preview: '60x70', thumb: '32>x32', featured: '300x50>') }
  end
end
