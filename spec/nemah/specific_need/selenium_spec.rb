require 'spec_helper'

describe Nemah::SpecificNeed::Selenium do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      horse = double(:weight_in_deciton => 5)
      need = double(:horse => horse)
      expect(Nemah::SpecificNeed::Selenium.new(need).to_rounded_range).to eq(1.00..25.00)
    end
  end
end
