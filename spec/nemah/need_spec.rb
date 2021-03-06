require 'spec_helper'

describe Nemah::Need do
  describe 'calculating solids' do
    it 'for an arabian princess' do
      expect(need_for_nemah.solids.to_rounded_range).to eq(6.75..Float::INFINITY)
    end

    it 'for a huge horse' do
      expect(need_for_samson.solids.to_rounded_range).to eq(13.50..Float::INFINITY)
    end
  end

  describe 'calculating energy need with a ±3 variance' do
    it 'for a non-working, hard to feed mare' do
      expect(need_for_nemah.energy.to_rounded_range).to eq(50.74..56.74)
    end

    it 'for a non-working, easy to feed gelding' do
      expect(need_for_samson.energy.to_rounded_range).to eq(79.16..85.16)
    end

    it 'for a non-working, normal to feed stallion' do
      expect(need_for_janus.energy.to_rounded_range).to eq(67.01..73.01)
    end

    it 'for a moderately-working, hard to feed mare' do
      expect(need_for_nemah(workload: moderate_workload).energy.to_rounded_range).to eq(71.31..77.31)
    end

    it 'for a hard-working, easy to feed gelding' do
      expect(need_for_samson(workload: hard_workload).energy.to_rounded_range).to eq(164.66..170.66)
    end
  end

  describe 'calculating protein need with a ±10% variance' do
    it 'for a non-working easy to feed gelding' do
      expect(need_for_samson.protein.to_rounded_range).to eq(443.66..542.25)
    end

    it 'for a moderately-working, hard to feed mare' do
      expect(need_for_nemah(workload: moderate_workload).protein.to_rounded_range).to eq(401.26..490.43)
    end
  end


  describe 'calculating calcium' do
    it 'for an arabian princess' do
      expect(need_for_nemah.calcium.to_rounded_range).to eq(18.00..Float::INFINITY)
    end
  end

  describe 'calculating magnesium' do
    it 'for an arabian princess' do
      expect(need_for_nemah.magnesium.to_rounded_range).to eq(6.75..Float::INFINITY)
    end
  end

  describe 'calculating phosphor' do
    it 'for an arabian princess' do
      expect(need_for_nemah.phosphor.to_rounded_range).to eq(12.60..Float::INFINITY)
    end
  end

  describe 'calculating selenium' do
    it 'for an arabian princess' do
      expect(need_for_nemah.selenium.to_rounded_range).to eq(0.90..22.50)
    end
  end

  describe 'calculating salt' do
    it 'for an arabian princess' do
      expect(need_for_nemah.salt.to_rounded_range).to eq(22.95..Float::INFINITY)
    end
  end


  private

  def moderate_workload
    Nemah::Workload.new(walk: 60, trot_and_canter: 40, days_per_week: 5)
  end

  def hard_workload
    Nemah::Workload.new(walk: 85, trot_and_canter: 60, days_per_week: 7)
  end

  def need_for_horse_with(args)
    Nemah::Need.new(Nemah::Horse.new(args))
  end

  def need_for_samson(args = {})
    need_for_horse_with({weight: 900, gender: :gelding, feedability: :easy}.merge args)
  end

  def need_for_nemah(args = {})
    need_for_horse_with({weight: 450, gender: :mare, feedability: :hard}.merge args)
  end

  def need_for_janus
    need_for_horse_with(weight: 600, gender: :stallion, feedability: :normal)
  end
end
