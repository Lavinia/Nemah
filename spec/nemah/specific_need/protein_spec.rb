require 'spec_helper'

describe Nemah::SpecificNeed::Protein do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      need = double(:energy => double(:ideal => 53.5))
      expect(Nemah::SpecificNeed::Protein.new(need).to_rounded_range).to eq(288.90..353.10)
    end
  end
end
