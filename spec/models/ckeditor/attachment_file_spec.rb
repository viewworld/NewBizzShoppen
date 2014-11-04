require 'spec_helper'

describe Ckeditor::AttachmentFile do
  it { expect(described_class.ancestors).to include Ckeditor::Asset }

  describe '#url_thumb' do
    let(:perform) { subject.url_thumb }
    let(:filename) { 'unknown' }
    before { subject.stub(filename: 'unknown') }

    it { expect(perform).to eq '/assets/ckeditor/filebrowser/images/thumbs/unknown.gif' }

    it 'gets image path through Ckeditor Utils' do
      Ckeditor::Utils.should_receive(:filethumb).with(filename)
      perform
    end
  end
end
