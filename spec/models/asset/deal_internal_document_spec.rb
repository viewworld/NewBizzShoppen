require 'spec_helper'

describe Asset::DealInternalDocument do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:deal).with_foreign_key :assetable_id }
  it { should validate_attachment_content_type(:data).
       allowing(*Asset::DOCUMENT_FILE_TYPES).
       rejecting(*Asset::IMAGE_FILE_TYPES) }
end
