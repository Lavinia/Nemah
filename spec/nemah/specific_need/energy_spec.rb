require 'spec_helper'

describe Nemah::SpecificNeed::Energy do
  it_behaves_like 'a specific need'

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

  def need
    workload = double('workload', walk: 30, trot_and_canter: 20, days_per_week: 4)
    horse = double('horse', stallion?: true, weight: 600, weight_in_deciton: 6.0, feedability: :normal, workload: workload)
    double('need', horse: horse)
  end
end
