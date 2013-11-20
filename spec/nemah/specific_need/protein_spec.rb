require 'spec_helper'

describe Nemah::SpecificNeed::Protein do
  it_behaves_like 'a specific need'

  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(protein.to_rounded_range).to eq(288.63..352.77)
    end

    it 'optionally takes the number of decimals' do
      expect(protein.to_rounded_range(decimals: 0)).to eq(289..353)
    end
  end

  describe '#ideal' do
    it 'returns the ideal amount of protein needed' do
      expect(protein.ideal).to eq(320.70)
    end

    it 'optionally takes the number of decimals' do
      expect(protein.ideal(decimals: 0)).to eq(321)
    end
  end

  describe '#min' do
    it 'returns the minimum protein need' do
      expect(protein.min).to eq(288.63)
    end

    it 'optionally takes the number of decimals' do
      expect(protein.min(decimals: 1)).to eq(288.6)
    end
  end

  describe '#max' do
    it 'returns the maximum protein need' do
      expect(protein.max).to eq(352.77)
    end

    it 'optionally takes the number of decimals' do
      expect(protein.max(decimals: 1)).to eq(352.8)
    end
  end

  def protein
    Nemah::SpecificNeed::Protein.new(need)
  end

  def need
    double(:energy => double(:ideal => 53.45))
  end
end
