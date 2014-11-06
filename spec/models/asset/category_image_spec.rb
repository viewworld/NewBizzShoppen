require 'spec_helper'

describe Asset::CategoryImage do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:category).with_foreign_key :assetable_id }
  it { should validate_attachment_content_type(:data).
       allowing(*Asset::IMAGE_FILE_TYPES).
       rejecting(*Asset::DOCUMENT_FILE_TYPES) }

  context 'image has defined extra styles' do
    let(:options) { subject.data.options }
    it { expect(options[:styles]).to eq(original: '100x150>', thumb: '32x32') }
  end

  describe '.attachment_options' do
    before { described_class.stub(s3_storage?: true) }
    let(:perform) { described_class.attachment_options }

    context 'with s3 storage' do
      it { expect(perform.values).to eq [:s3, 'https', "#{Rails.root}/config/s3.yml", :private, 'assets/:id/:style/:basename.:extension'] }
    end
  end
end
