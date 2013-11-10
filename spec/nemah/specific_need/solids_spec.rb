require 'spec_helper'

describe Nemah::SpecificNeed::Solids do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(solids.to_rounded_range).to eq(7.65..Float::INFINITY)
    end
  end

  describe '#ideal' do
    it 'returns the ideal amount of solids needed' do
      expect(solids.ideal).to eq(7.65)
    end

    it 'optionally takes the number of decimals' do
      expect(solids.ideal(decimals: 1)).to eq(7.7)
    end
  end

  describe '#min' do
    it 'returns the minimum solids need' do
      expect(solids.min).to eq(7.65)
    end

    it 'optionally takes the number of decimals' do
      expect(solids.min(decimals: 1)).to eq(7.7)
    end
  end

  describe '#max' do
    it 'returns the maximum solids need' do
      expect(solids.max).to eq(Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(solids.max(decimals: 10)).to eq(Float::INFINITY)
    end
  end

  private

  def solids
    Nemah::SpecificNeed::Solids.new(need)
  end

  def need
    double(:horse => double(:weight_in_deciton => 5.1))
  end
end
