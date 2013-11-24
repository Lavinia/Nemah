require 'spec_helper'

describe Nemah::SpecificNeed::Calcium do
  it_behaves_like 'a specific need'

  let(:energy) { double('energy', :for_maintenance => 50.0, :for_workload => 0.0) }

  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(calcium.to_rounded_range).to eq(21.20..Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(calcium.to_rounded_range(decimals: 0)).to eq(21..Float::INFINITY)
    end

    context 'with a workload' do
      def mineral_for_horse_with_workload_energy_need(workload)
        workload_energy_need = double('energy', :for_maintenance => 40.0, :for_workload => workload)
        fake_need = double('need', :horse => double(:weight_in_deciton => 5.3), :energy => workload_energy_need)
        Nemah::SpecificNeed::Calcium.new(fake_need)
      end

      it 'adjusts for a light workload' do
        mineral = mineral_for_horse_with_workload_energy_need(10.0)
        expect(mineral.to_rounded_range).to eq(31.8..Float::INFINITY)
      end

      it 'adjusts for a medium workload' do
        mineral = mineral_for_horse_with_workload_energy_need(12.0)
        expect(mineral.to_rounded_range).to eq(37.10..Float::INFINITY)
      end

      it 'adjusts for a hard workload' do
        mineral = mineral_for_horse_with_workload_energy_need(20.0)
        expect(mineral.to_rounded_range).to eq(42.40..Float::INFINITY)
      end

      it 'adjusts for a very hard workload' do
        mineral = mineral_for_horse_with_workload_energy_need(30.0)
        expect(mineral.to_rounded_range).to eq(42.40..Float::INFINITY)
      end
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
