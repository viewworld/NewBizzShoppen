require 'spec_helper'

describe Fixnum do
  context '#to_time' do
    subject { number.to_time }

    context 'without number of days' do
      let(:number) { 3123 }
      it(:return) { should eq '00:52:03' }
    end

    context 'with days' do
      let(:number) { 223123 }
      it(:return) { should eq '2d 13:58:43' }

      context 'with really huge number of days' do
        let(:number) { 59231230 }
        it(:return) { should eq '685d 13:07:10' }
      end

      context 'with custom format' do
        subject { number.to_time('%H:%M') }

        it(:return) { should eq '2d 13:58' }
      end
    end
  end
end
