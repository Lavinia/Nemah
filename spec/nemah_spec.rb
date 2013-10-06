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

    private

    def a_horse_named(name)
      Nemah::Horse.new(default_attributes.merge(name: name))
    end

    def a_horse_without(attribute)
      Nemah::Horse.new(default_attributes.delete_if { |key, _| key == attribute })
    end

    def default_attributes
      { weight: 450, gender: 'mare' }
    end
  end
end
