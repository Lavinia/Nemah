require 'spec_helper'

describe Nemah::SpecificNeed::Energy do
  it_behaves_like 'a specific need' do
    let(:unit) { :MJ }
  end

  describe '#for_workload' do
    it 'returns the workload portion of the energy need' do
      expect(energy.for_workload).to eq(10.97)
    end
  end

  describe '#for_maintenance' do
    it 'returns the maintenance energy need' do
      expect(energy.for_maintenance).to eq(70.01)
    end
  end

  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      expect(energy.to_rounded_range).to eq(77.98..83.98)
    end

    it 'optionally takes the number of decimals' do
      expect(energy.to_rounded_range(decimals: 3)).to eq(77.982..83.982)
    end
  end

  describe '#ideal' do
    it 'returns the ideal energy need' do
      expect(energy.ideal).to eq(80.98)
    end

    it 'optionally takes the number of decimals' do
      expect(energy.ideal(decimals: 5)).to eq(80.98229)
    end
  end

  describe '#min' do
    it 'returns the minimum energy need' do
      expect(energy.min).to eq(77.98)
    end

    it 'optionally takes the number of decimals' do
      expect(energy.min(decimals: 4)).to eq(77.9823)
    end

    it 'cannot be less than 0' do
      feather_weight_horse_energy = Nemah::SpecificNeed::Energy.new(need(weight: 0.1))
      expect(feather_weight_horse_energy.min).to eq(0)
    end
  end

  describe '#max' do
    it 'returns the maximum energy need' do
      expect(energy.max).to eq(83.98)
    end

    it 'optionally takes the number of decimals' do
      expect(energy.max(decimals: 0)).to eq(84)
    end
  end

  private

  def energy
    Nemah::SpecificNeed::Energy.new(need)
  end

  def need(weight: 600)
    workload = double('workload', walk: 30, trot_and_canter: 20, days_per_week: 4)
    horse = double('horse', stallion?: true, weight: weight, weight_in_deciton: weight / 100.0, feedability: :normal, workload: workload)
    double('need', horse: horse)
  end
end
