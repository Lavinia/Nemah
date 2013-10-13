require 'spec_helper'

describe Nemah::Need do
  describe 'calculating solids' do
    it 'for an arabian princess' do
      expect(need_for_nemah.solids).to eq(6.75..Float::INFINITY)
    end

    it 'for a huge horse' do
      expect(need_for_samson.solids).to eq(18.00..Float::INFINITY)
    end
  end

  describe 'calculating selenium' do
    it 'for an arabian princess' do
      expect(need_for_nemah.selenium).to eq(0.9..22.5)
    end
  end

  private

  def need_for_horse_with(args)
    Nemah::Need.new(Nemah::Horse.new(args))
  end

  def need_for_samson
    need_for_horse_with(weight: 1200, gender: :stallion)
  end

  def need_for_nemah
    need_for_horse_with(weight: 450, gender: :mare)
  end
end
