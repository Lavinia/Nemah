require 'spec_helper'

describe Nemah::SpecificNeed::Energy do
  describe '#to_rounded_range' do
    it 'returns a range between minimum and maximum allowed amounts, rounded to two decimals' do
      workload = double(walk: 30, trot_and_canter: 20, days_per_week: 4)
      horse = double(stallion?: true, weight: 600, weight_in_deciton: 6.0, feedability: :normal, workload: workload)
      need = double(horse: horse)
      expect(Nemah::SpecificNeed::Energy.new(need).to_rounded_range).to eq(77.98..83.98)
    end
  end
end
