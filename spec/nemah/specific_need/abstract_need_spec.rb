require 'spec_helper'

class FakeNeed < Nemah::SpecificNeed::AbstractNeed
  def min
    78.67
  end

  def unit
    'ghostscreams'
  end
end

describe Nemah::SpecificNeed::AbstractNeed do
  describe '#to_s' do
    let(:fake_need) { FakeNeed.new(double) }

    it 'combines the minimum need with the unit' do
      expect(fake_need.to_s).to eq '78.67 ghostscreams'
    end
  end
end
