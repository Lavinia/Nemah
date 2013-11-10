require 'spec_helper'

describe Nemah::SpecificNeed::Protein do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(protein.to_rounded_range).to eq(288.90..353.10)
    end
  end

  describe '#ideal' do
    it 'returns the ideal amount of protein needed' do
      expect(protein.ideal).to eq(321)
    end
  end

  def protein
    Nemah::SpecificNeed::Protein.new(need)
  end

  def need
    double(:energy => double(:ideal => 53.5))
  end
end
