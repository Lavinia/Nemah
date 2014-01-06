require 'spec_helper'

describe Nemah::FodderList do
  let(:fodder) { double('hay') }

  it 'contains no fodders by default' do
    fodder_list = Nemah::FodderList.new
    expect(fodder_list.count).to eq 0
  end

  describe '#amount_of' do
    it 'returns the amount of a given fodder' do
      fodder_list = Nemah::FodderList.new(fodder => 5)
      expect(fodder_list.amount_of fodder).to eq 5
    end

    it 'returns zero if the fodder is not in the list' do
      fodder_list = Nemah::FodderList.new
      expect(fodder_list.amount_of :non_existing_fodder).to eq 0
    end
  end

  describe '#add' do
    subject(:fodder_list) { Nemah::FodderList.new }

    it 'adds an amount of fodder to the list' do
      fodder_list.add fodder, 0.5
      expect(fodder_list.amount_of fodder).to eq 0.5
    end

    it 'returns the fodder list' do
      expect(fodder_list.add(fodder, 0.5)).to eq fodder_list
    end
  end

  describe '#remove' do
    subject(:fodder_list) { Nemah::FodderList.new(fodder => 0.5) }

    it 'removes the fodder from the list' do
      fodder_list.remove fodder
      expect(fodder_list.count).to eq 0
    end

    it 'returns the fodder list' do
      expect(fodder_list.remove fodder).to eq fodder_list
    end
  end
end
