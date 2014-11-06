require 'spec_helper'

describe Ckeditor::Picture do
  it { expect(described_class.ancestors).to include Ckeditor::Asset }
  it { should validate_attachment_content_type(:data).
       allowing(*Asset::IMAGE_FILE_TYPES).
       rejecting(*Asset::DOCUMENT_FILE_TYPES) }

  context 'image has defined extra styles' do
    let(:options) { subject.data.options }
    it { expect(options[:styles]).to eq(content: '800>', thumb: '118x100#') }
  end

  describe '#url_content' do
    let(:perform) { subject.url_content }

    it 'gets url' do
      subject.should_receive(:url).with(:content)
      perform
    end
  end
end
