require 'spec_helper'

shared_examples_for 'a nutrient' do
  it 'returns 0.0 by default' do
    expect(build_fodder.send(nutrient).value).to eq 0.0
  end

  it 'returns the amount of the nutrient' do
    fodder = build_fodder(nutrient => 1.5)
    expect(fodder.send(nutrient).value).to eq 1.5
  end

  it 'returns the nutrient unit' do
    fodder = build_fodder(nutrient => 1.5)
    expect(fodder.send(nutrient).unit).to eq unit
  end
end

describe Nemah::Fodder do
  def build_fodder(nutrients = {})
    Nemah::Fodder.new('hay', nutrients)
  end

  it 'has a name' do
    expect(build_fodder.name).to eq 'hay'
  end

  describe '#calcium' do
    it_behaves_like 'a nutrient' do
      let(:nutrient) { :calcium }
      let(:unit) { :g }
    end
  end

  describe '#selenium' do
    it_behaves_like 'a nutrient' do
      let(:nutrient) { :selenium }
      let(:unit) { :mg }
    end
  end

  describe '#energy' do
    it_behaves_like 'a nutrient' do
      let(:nutrient) { :energy }
      let(:unit) { :MJ }
    end
  end

  describe '#protein' do
    it_behaves_like 'a nutrient' do
      let(:nutrient) { :protein }
      let(:unit) { :g }
    end
  end

  describe '#solids' do
    it_behaves_like 'a nutrient' do
      let(:nutrient) { :solids }
      let(:unit) { :percent_per_kg }
    end

    it 'returns the amount of solids in kilograms if specified' do
      fodder = build_fodder(solids: 67.5)
      expect(fodder.solids.value(:kg)).to eq 0.675
    end
  end
end
