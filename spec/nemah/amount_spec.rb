require 'spec_helper'

describe Nemah::Amount do
  describe '#unit' do
    it 'returns the unit portion of the amount' do
      amount = Nemah::Amount.new(5.5, :kg)
      expect(amount.unit).to eq :kg
    end
  end

  describe '#value' do
    it 'returns the value portion of the amount' do
      amount = Nemah::Amount.new(5.5, :kg)
      expect(amount.value).to eq 5.5
    end

    it 'can convert from percent of kilograms to kilograms' do
      amount = Nemah::Amount.new(60.0, :percent_per_kg)
      expect(amount.value(:kg)).to eq 0.60
    end
  end
end
