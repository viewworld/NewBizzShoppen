require 'spec_helper'

describe Asset::DealMaterial do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:deal).with_foreign_key(:assetable_id).touch true }
  it { should validate_attachment_content_type(:data).
       allowing(*(Asset::IMAGE_FILE_TYPES | Asset::DOCUMENT_FILE_TYPES)) }
end
