require 'spec_helper'

describe Nemah::Fodder do
  def build_fodder(nutrients = {})
    Nemah::Fodder.new('hay', nutrients)
  end

  it 'has a name' do
    expect(build_fodder.name).to eq 'hay'
  end

  describe '#calcium' do
    it 'returns 0.0 by default' do
      expect(build_fodder.calcium.value).to eq 0.0
    end

    it 'returns the amount of calcium' do
      fodder = build_fodder(calcium: 1.5)
      expect(fodder.calcium.value).to eq 1.5
    end

    it 'returns the amount of calcium in grams' do
      fodder = build_fodder(calcium: 1.5)
      expect(fodder.calcium.unit).to eq :g
    end
  end

  describe '#selenium' do
    it 'returns 0.0 by default' do
      expect(build_fodder.selenium.value).to eq 0.0
    end

    it 'returns the amount of selenium' do
      fodder = build_fodder(selenium: 0.6)
      expect(fodder.selenium.value).to eq 0.6
    end

    it 'returns the amount of selenium in milligrams' do
      fodder = build_fodder(selenium: 0.6)
      expect(fodder.selenium.unit).to eq :mg
    end
  end



  describe '#energy' do
    it 'returns 0.0 by default' do
      expect(build_fodder.energy.value).to eq 0.0
    end

    it 'returns the amount of energy' do
      fodder = build_fodder(energy: 11.2)
      expect(fodder.energy.value).to eq 11.2
    end

    it 'returns the amount of energy in MJ' do
      fodder = build_fodder(energy: 11.2)
      expect(fodder.energy.unit).to eq :MJ
    end
  end

  describe '#protein' do
    it 'returns 0.0 by default' do
      expect(build_fodder.protein.value).to eq 0.0
    end

    it 'returns the amount of protein' do
      fodder = build_fodder(protein: 34)
      expect(fodder.protein.value).to eq 34
    end

    it 'returns the amount of protein in grams' do
      fodder = build_fodder(protein: 28.6)
      expect(fodder.protein.unit).to eq :g
    end
  end

  describe '#solids' do
    it 'returns 0.0 by default' do
      expect(build_fodder.solids.value).to eq 0.0
    end

    context 'with a specified amount' do
      subject(:fodder) { build_fodder(solids: 67.5) }

      it 'returns the amount of solids' do
        expect(fodder.solids.value).to eq 67.5
      end

      it 'returns the amount of solids in percent per kilogram' do
        expect(fodder.solids.unit).to eq :percent_per_kg
      end

      it 'returns the amount of solids in kilograms if specified' do
        expect(fodder.solids.value(:kg)).to eq 0.675
      end
    end
  end
end
