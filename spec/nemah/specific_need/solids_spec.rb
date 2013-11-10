require 'spec_helper'

describe Nemah::SpecificNeed::Solids do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(solids.to_rounded_range).to eq(7.50..Float::INFINITY)
    end
  end

  describe '#ideal' do
    it 'returns the ideal amount of solids needed' do
      expect(solids.ideal).to eq(7.50)
    end
  end

  private

  def solids
    Nemah::SpecificNeed::Solids.new(need)
  end

  def need
    double(:horse => double(:weight_in_deciton => 5))
  end
end
