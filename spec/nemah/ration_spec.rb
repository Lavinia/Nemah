require 'spec_helper'

describe Nemah::Ration do
  describe '#enough_energy?' do
    it "returns true when the horse's energy need is met" do
      energy = double('energy', min: 65, unit: :MJ)
      need = double('need', energy: energy)
      fodders = { Nemah::Fodder.new('hay', { energy: 6.5 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_energy?).to be_true
    end

    it 'returns false when the energy need is not met' do
      energy = double('energy', min: 65.1, unit: :MJ)
      need = double('need', energy: energy)
      fodders = { Nemah::Fodder.new('hay', { energy: 6.5 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_energy?).to be_false
    end
  end

  describe '#enough_protein?' do
    it "returns true when the horse's protein need is met" do
      protein = double('protein', min: 330, unit: :g)
      need = double('need', protein: protein)
      fodders = { Nemah::Fodder.new('hay', { protein: 33 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_protein?).to be_true
    end

    it "returns false when the horse's protein need is not met" do
      protein = double('protein', min: 331, unit: :g)
      need = double('need', protein: protein)
      fodders = { Nemah::Fodder.new('hay', { protein: 33 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_protein?).to be_false
    end
  end

  describe '#enough_solids?' do
    it "returns true when the horse's solids need is met" do
      solids = double('solids', min: 7, unit: :kg)
      need = double('need', solids: solids)
      fodders = { Nemah::Fodder.new('hay', { solids: 70 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_solids?).to be_true
    end

    it "returns false when the horse's solids need is not met" do
      solids = double('solids', min: 7.1, unit: :kg)
      need = double('need', solids: solids)
      fodders = { Nemah::Fodder.new('hay', { solids: 70 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_solids?).to be_false
    end
  end
end
