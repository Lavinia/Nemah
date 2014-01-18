require 'spec_helper'

describe Nemah::FodderList do
  let(:fodder) { Nemah::Fodder.new('hay') }

  it 'contains no fodders by default' do
    fodder_list = build_fodder_list
    expect(fodder_list.count).to eq 0
  end

  describe '#amount_of' do
    it 'returns the amount of a given fodder' do
      fodder_list = build_fodder_list(fodder => 5)
      expect(fodder_list.amount_of fodder).to eq 5
    end

    it 'returns zero if the fodder is not in the list' do
      fodder_list = build_fodder_list
      expect(fodder_list.amount_of :non_existing_fodder).to eq 0
    end
  end

  describe '#add' do
    subject(:fodder_list) { build_fodder_list }

    it 'adds a fodder to the list' do
      fodder_list.add fodder
      expect(fodder_list.count).to eq 1
    end

    it 'adds a specified amount of fodder to the list' do
      fodder_list.add fodder, 0.5
      expect(fodder_list.amount_of fodder).to eq 0.5
    end

    it 'increases the amount of a fodder already in the list' do
      fodder_list.add fodder, 1
      fodder_list.add fodder, 2
      expect(fodder_list.amount_of fodder).to eq 3
    end

    it 'returns the fodder list' do
      expect(fodder_list.add(fodder, 0.5)).to eq fodder_list
    end
  end

  describe '#remove' do
    subject(:fodder_list) { build_fodder_list(fodder => 5) }

    it 'removes the fodder from the list if no amount is specified' do
      fodder_list.remove fodder
      expect(fodder_list.count).to eq 0
    end

    it 'removes the given amount of a fodder, without removing the fodder from the list' do
      fodder_list.remove(fodder, 1.5)
      expect(fodder_list.amount_of fodder).to eq 3.5
    end

    it 'does not reduce the amount below zero' do
      fodder_list.remove(fodder, 100)
      expect(fodder_list.amount_of fodder).to eq 0
    end

    it 'returns the fodder list' do
      expect(fodder_list.remove fodder).to eq fodder_list
    end
  end

  describe '#to_h' do
    let(:fodders) { { fodder => 10.0 } }
    subject(:fodder_list) { build_fodder_list(fodders) }

    it 'returns a hash representation of the list' do
      expect(fodder_list.to_h).to eq fodders
    end

    it 'changing the hash does not change the fodder list' do
      fodder_list.to_h[fodder] = 0
      expect(fodder_list.amount_of(fodder)).to eq 10.0
    end
  end

  describe '#each' do
    subject(:fodder_list) { build_fodder_list(fodder => 5.0) }

    it 'returns an enumerator for the list when not given a block' do
      expect(fodder_list.each.next).to eq [fodder, 5.0]
    end

    it 'yields the fodder and amount pairs in the list when given a block' do
      yielded_fodder_and_amount = :not_set
      fodder_list.each { |fodder_and_amount| yielded_fodder_and_amount = fodder_and_amount  }

      expect(yielded_fodder_and_amount).to eq [fodder, 5.0]
    end
  end
end

def build_fodder_list(fodders = {})
  Nemah::FodderList.new(fodders)
end
