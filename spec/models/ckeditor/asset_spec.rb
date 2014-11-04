require 'spec_helper'

describe Ckeditor::Asset do
  it { expect(described_class.ancestors).to include Asset }
end
