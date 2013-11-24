require 'spec_helper'

describe Nemah::SpecificNeed::Calcium do
  it_behaves_like 'a specific need'

  let(:energy) { double('energy', :ideal => 50.0, :for_workload => 0.0) }

  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(calcium.to_rounded_range).to eq(21.20..Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(calcium.to_rounded_range(decimals: 0)).to eq(21..Float::INFINITY)
    end

    it 'adjusts for a light workload' do
      light_workload_energy_need = double('energy', :ideal => 50.0, :for_workload => 10.0)
      my_need = double('need', :horse => double(:weight_in_deciton => 5.3), :energy => light_workload_energy_need)
      my_calcium = Nemah::SpecificNeed::Calcium.new(my_need)

      expect(my_calcium.to_rounded_range).to eq(31.8..Float::INFINITY)
    end
  end

  describe '#ideal' do
    it 'returns the ideal amount of calcium needed' do
      expect(calcium.ideal).to eq(21.20)
    end

    it 'optionally takes the number of decimals' do
      expect(calcium.ideal(decimals: 0)).to eq(21)
    end
  end

  describe '#min' do
    it 'returns the minimum calcium need' do
      expect(calcium.min).to eq(21.20)
    end

    it 'optionally takes the number of decimals' do
      expect(calcium.min(decimals: 0)).to eq(21)
    end
  end

  describe '#max' do
    it 'returns the maximum calcium need' do
      expect(calcium.max).to eq(Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(calcium.max(decimals: 0)).to eq(Float::INFINITY)
    end
  end

  def calcium
    Nemah::SpecificNeed::Calcium.new(need)
  end

  def need
    double('need', :horse => double('horse', :weight_in_deciton => 5.3), energy: energy)
  end
end
