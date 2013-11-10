require 'spec_helper'

describe Nemah::SpecificNeed::Protein do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(protein.to_rounded_range).to eq(288.63..352.77)
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

  def protein
    Nemah::SpecificNeed::Protein.new(need)
  end

  def need
    double(:energy => double(:ideal => 53.45))
  end
end
