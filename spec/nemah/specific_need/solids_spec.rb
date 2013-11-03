require 'spec_helper'

describe Nemah::SpecificNeed::Solids do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      need = double(:horse => double(:weight_in_deciton => 5))
      expect(Nemah::SpecificNeed::Solids.new(need).to_rounded_range).to eq(7.50..Float::INFINITY)
    end
  end
end