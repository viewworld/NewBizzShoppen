require 'spec_helper'

describe Asset::DealMaterial do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:deal).with_foreign_key(:assetable_id).touch true }
end
