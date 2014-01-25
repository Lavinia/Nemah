require 'spec_helper'

describe Nemah::Ration do
  describe '#enough_energy?' do
    it "returns true when the horse's energy need is met" do
      energy = double('energy', min: 65)
      need = double('need', energy: energy)
      fodders = { Nemah::Fodder.new('hay', { energy: 6.5 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_energy?).to be_true
    end

    it 'returns false when the energy need is not met' do
      energy = double('energy', min: 65.1)
      need = double('need', energy: energy)
      fodders = { Nemah::Fodder.new('hay', { energy: 6.5 }) => 10 }
      fodder_list = Nemah::FodderList.new(fodders)
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.enough_energy?).to be_false
    end
  end
end
