require 'spec_helper'

describe Nemah::SpecificNeed::Selenium do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(selenium.to_rounded_range).to eq(1.06..26.50)
    end
  end

  describe '#ideal' do
    it 'returns the ideal amount of selenium needed' do
      expect(selenium.ideal).to eq(1.06)
    end

    it 'optionally takes the number of decimals' do
      expect(selenium.ideal(decimals: 1)).to eq(1.1)
    end
  end

  private

  def selenium
    Nemah::SpecificNeed::Selenium.new(need)
  end

  def need
    double(:horse => double(:weight_in_deciton => 5.3))
  end
end
