require 'spec_helper'

describe Asset::CountryLogo do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:country).with_foreign_key :assetable_id }
  it { should validate_attachment_content_type(:data).
       allowing(*Asset::IMAGE_FILE_TYPES).
       rejecting(*Asset::DOCUMENT_FILE_TYPES) }

  describe '.attachment_options' do
    before { described_class.stub(s3_storage?: true) }
    let(:perform) { described_class.attachment_options }

    context 'with s3 storage' do
      it { expect(perform.values).to eq [:s3, 'https', "#{Rails.root}/config/s3.yml", :private, 'assets/:id/:style/:basename.:extension'] }
    end
  end
end
