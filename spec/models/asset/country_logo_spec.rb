require 'spec_helper'

describe Asset::CountryLogo do
  it { expect(described_class.ancestors).to include Asset }
  it { should belong_to(:country).with_foreign_key :assetable_id }

  describe '.attachment_options' do
    before { described_class.stub(s3_storage?: true) }
    let(:perform) { described_class.attachment_options }

    context 'with s3 storage' do
      it { expect(perform.values).to eq [:s3, 'https', "#{Rails.root}/config/s3.yml", :private, 'assets/:id/:style/:basename.:extension'] }
    end
  end
end
