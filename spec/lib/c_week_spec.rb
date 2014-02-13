require 'spec_helper'

describe CWeek do
  let(:year) { 2013 }
  let(:first) { described_class.new(1, year) }
  let(:second) { described_class.new(2, year) }
  let(:last_week) { described_class.last(year) }
  subject { first }

  context 'class methods' do
    subject { described_class }

    its(:first) { should eq described_class.new(1, Date.today.year) }
    its(:last) { should eq described_class.new(52, Date.today.year) }

    context 'with passed year to method' do
      it { expect(subject.first(year)).to eq described_class.new(1, year) }
      it { expect(subject.last(year)).to eq described_class.new(52, year) }
    end
  end

  describe '#<=>' do
    let(:first_clone) { first.dup }

    it { expect(first <=> second).to eq(-1) }
    it { expect(first <=> first_clone).to eq 0 }
    it { expect(second <=> first).to eq 1 }
  end

  describe '#succ' do
    its(:succ) { should eq second }

    context 'next date for the last week of the year' do
      subject { last_week }

      its(:succ) { should eq described_class.new(1, 2014) }
    end
  end

  its(:cweek) { should eq 1 }

  describe '#year' do
    subject { last_week }

    its(:year) { should eq [2013] }

    context 'when week ends in new year' do
      subject { first }

      its(:year) { should eq [2012, 2013] }
    end
  end

  its(:inspect) { should eq '1/2013' }
  its(:to_s) { should eq subject.cweek }
end
