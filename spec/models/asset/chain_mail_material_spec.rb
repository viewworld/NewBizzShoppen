require 'spec_helper'

describe Asset::ChainMailMaterial do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:chain_mail_type).with_foreign_key :assetable_id }
  it { should have_and_belong_to_many(:chain_mail_items) }
  it { should validate_attachment_content_type(:data).
       allowing(*(Asset::IMAGE_FILE_TYPES | Asset::DOCUMENT_FILE_TYPES)) }
end
