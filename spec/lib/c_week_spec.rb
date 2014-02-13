require 'spec_helper'

describe CWeek do
  let(:year) { 2013 }
  let(:first_week_of_the_year) { described_class.new(1, year) }
  let(:second_week_of_the_year) { described_class.new(2, year) }
  subject { first_week_of_the_year }

  context 'class methods' do
    subject { described_class }

    describe '.first' do
      its(:first) { should eq described_class.new(1, Date.today.year) }

      context 'with passed year to method' do
        it { expect(subject.last(year)).to eq described_class.new(52, year) }
      end
    end

    describe '.last' do
      its(:last) { should eq described_class.new(52, Date.today.year) }

      context 'with passed year to method' do
        it { expect(subject.first(year)).to eq described_class.new(1, year) }
      end
    end
  end

  describe '#<=>' do
    let(:first_week_of_the_year_clone) { first_week_of_the_year.dup }

    it { expect(first_week_of_the_year <=> second_week_of_the_year).to eq(-1) }
    it { expect(first_week_of_the_year <=> first_week_of_the_year_clone).to eq 0 }
    it { expect(second_week_of_the_year <=> first_week_of_the_year).to eq 1 }
  end

  describe '#succ' do
    let(:last_week_of_the_year) { described_class.last(year) }

    its(:succ) { should eq second_week_of_the_year }

    context 'next date for the last week of the year' do
      subject { last_week_of_the_year }

      its(:succ) { should eq described_class.new(1, 2014) }
    end
  end

  its(:cweek) { should eq 1 }

  describe '#year' do
    let(:last_week_of_the_year) { described_class.last(year) }

    subject { last_week_of_the_year }

    its(:year) { should eq [2013] }

    context 'when week ends in new year' do
      subject { first_week_of_the_year }

      its(:year) { should eq [2012, 2013] }
    end
  end

  its(:inspect) { should eq '1/2013' }
  its(:to_s) { should eq subject.cweek }
end
