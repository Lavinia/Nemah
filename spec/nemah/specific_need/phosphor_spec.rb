require 'spec_helper'

describe Nemah::SpecificNeed::Phosphor do
  it_behaves_like 'a specific need'

  let(:energy) { double('energy', :for_maintenance => 50.0, :for_workload => 0.0) }

  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(phosphor.to_rounded_range).to eq(14.84..Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(phosphor.to_rounded_range(decimals: 0)).to eq(15..Float::INFINITY)
    end

    context 'with a workload' do
      def mineral_for_horse_with_workload_energy_need(workload)
        workload_energy_need = double('energy', :for_maintenance => 40.0, :for_workload => workload)
        fake_need = double('need', :horse => double(:weight_in_deciton => 5.3), :energy => workload_energy_need)
        Nemah::SpecificNeed::Phosphor.new(fake_need)
      end

      it 'adjusts for a light workload' do
        mineral = mineral_for_horse_with_workload_energy_need(10.0)
        expect(mineral.to_rounded_range).to eq(19.08..Float::INFINITY)
      end

      it 'adjusts for a medium workload' do
        mineral = mineral_for_horse_with_workload_energy_need(12.0)
        expect(mineral.to_rounded_range).to eq(22.26..Float::INFINITY)
      end

      it 'adjusts for a hard workload' do
        mineral = mineral_for_horse_with_workload_energy_need(20.0)
        expect(mineral.to_rounded_range).to eq(30.74..Float::INFINITY)
      end

      it 'adjusts for a very hard workload' do
        mineral = mineral_for_horse_with_workload_energy_need(30.0)
        expect(mineral.to_rounded_range).to eq(30.74..Float::INFINITY)
      end
    end
  end

  describe '#ideal' do
    it 'returns the ideal amount of phosphor needed' do
      expect(phosphor.ideal).to eq(14.84)
    end

    it 'optionally takes the number of decimals' do
      expect(phosphor.ideal(decimals: 1)).to eq(14.8)
    end
  end

  describe '#min' do
    it 'returns the minimum phosphor need' do
      expect(phosphor.min).to eq(14.84)
    end

    it 'optionally takes the number of decimals' do
      expect(phosphor.min(decimals: 0)).to eq(15)
    end
  end

  describe '#max' do
    it 'returns the maximum phosphor need' do
      expect(phosphor.max).to eq(Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(phosphor.max(decimals: 0)).to eq(Float::INFINITY)
    end
  end

  def phosphor
    Nemah::SpecificNeed::Phosphor.new(need)
  end

  def need
    double('need', :horse => double('horse', :weight_in_deciton => 5.3), energy: energy)
  end
end
