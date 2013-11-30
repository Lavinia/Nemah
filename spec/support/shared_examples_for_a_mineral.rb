shared_examples_for 'a mineral' do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(mineral.to_rounded_range).to eq(no_workload_min_need..Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(mineral.to_rounded_range(decimals: 0)).to eq(no_workload_min_need.round(0)..Float::INFINITY)
    end

    context 'with a workload' do
      it 'adjusts for a light workload' do
        mineral = mineral_for_horse_with_workload_energy_need(10.0)
        expect(mineral.to_rounded_range).to eq(light_workload_min_need..Float::INFINITY)
      end

      it 'adjusts for a medium workload' do
        mineral = mineral_for_horse_with_workload_energy_need(12.0)
        expect(mineral.to_rounded_range).to eq(medium_workload_min_need..Float::INFINITY)
      end

      it 'adjusts for a hard workload' do
        mineral = mineral_for_horse_with_workload_energy_need(20.0)
        expect(mineral.to_rounded_range).to eq(hard_workload_min_need..Float::INFINITY)
      end

      it 'adjusts for a very hard workload' do
        mineral = mineral_for_horse_with_workload_energy_need(30.0)
        expect(mineral.to_rounded_range).to eq(very_hard_workload_min_need..Float::INFINITY)
      end
    end
  end

  describe '#ideal' do
    it 'returns the ideal need' do
      expect(mineral.ideal).to eq(no_workload_min_need)
    end

    it 'optionally takes the number of decimals' do
      expect(mineral.ideal(decimals: 1)).to eq(no_workload_min_need.round(1))
    end
  end

  describe '#min' do
    it 'returns the minimum need' do
      expect(mineral.min).to eq(no_workload_min_need)
    end

    it 'optionally takes the number of decimals' do
      expect(mineral.min(decimals: 0)).to eq(no_workload_min_need.round(0))
    end
  end

  describe '#max' do
    it 'returns the maximum need' do
      expect(mineral.max).to eq(Float::INFINITY)
    end

    it 'optionally takes the number of decimals' do
      expect(mineral.max(decimals: 0)).to eq(Float::INFINITY)
    end
  end

  def mineral
    mineral_for_horse_with_workload_energy_need(0.0)
  end

  def mineral_for_horse_with_workload_energy_need(workload)
    workload_energy_need = double('energy', :for_maintenance => 40.0, :for_workload => workload)
    fake_need = double('need', :horse => double(:weight_in_deciton => 5.3), :energy => workload_energy_need)
    described_class.new(fake_need)
  end
end
