require 'spec_helper'

describe Nemah::Need do
  describe 'calculating solids' do
    it 'for an arabian princess' do
      horse = Nemah::Horse.new(weight: 450, gender: :mare)
      need = Nemah::Need.new(horse)
      expect(need.solids).to eq(6.75..Float::INFINITY)
    end

    it 'for a huge horse' do
      horse = Nemah::Horse.new(weight: 1200, gender: :stallion)
      need = Nemah::Need.new(horse)
      expect(need.solids).to eq(18.00..Float::INFINITY)
    end
  end

  describe 'calculating selenium' do
    it 'for an arabian princess' do
      horse = Nemah::Horse.new(weight: 450, gender: :mare)
      need = Nemah::Need.new(horse)
      expect(need.selenium).to eq(0.9..22.5)
    end
  end
end
