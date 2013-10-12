require 'spec_helper'

describe Nemah do
  describe Nemah::Horse do
    it 'must have a weight' do
      expect { a_horse_without(:weight) }.to raise_error(ArgumentError, 'weight required')
    end

    it 'must have a gender' do
      expect { a_horse_without(:gender) }.to raise_error(ArgumentError, 'gender required')
    end

    it 'can be named' do
      expect(a_horse_named('Nemah').name).to eq('Nemah')
    end

    it 'is considered to be of normal difficulty to feed' do
      expect(a_horse.feedability).to eq(:normal)
    end

    it 'can be hard to feed' do
      expect(a_horse_with(feedability: :hard).feedability).to eq(:hard)
    end

    it 'can be easy to feed' do
      expect(a_horse_with(feedability: :easy).feedability).to eq(:easy)
    end

    it 'cannot be impossible to feed' do
      expect {
        a_horse_with(feedability: :impossible)
      }.to raise_error(ArgumentError, '":impossible" is not an allowed feedability')
    end

    private

    def a_horse
      Nemah::Horse.new(default_attributes)
    end

    def a_horse_with(attributes)
      Nemah::Horse.new(default_attributes.merge(attributes))
    end

    def a_horse_without(attribute)
      Nemah::Horse.new(default_attributes.delete_if { |key, _| key == attribute })
    end

    def a_horse_named(name)
      a_horse_with(name: name)
    end

    def default_attributes
      { weight: 450, gender: 'mare' }
    end
  end
end
