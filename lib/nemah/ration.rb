module Nemah
  class Ration
    attr_reader :fodder_list, :need

    def initialize(need, fodder_list)
      @fodder_list = fodder_list
      @need = need
    end

    def enough_energy?
      given_energy = fodder_list.each.inject(0) do |total_energy, (fodder, amount)|
        total_energy += amount * fodder.energy.value(need.energy.unit)
      end
      need.energy.min <= given_energy
    end

    def enough_protein?
      given_protein = fodder_list.each.inject(0) do |total_protein, (fodder, amount)|
        total_protein += amount * fodder.protein.value(need.protein.unit)
      end
      need.protein.min <= given_protein
    end

    def enough_solids?
      given_solids = fodder_list.each.inject(0) do |total_solids, (fodder, amount)|
        total_solids += amount * fodder.solids.value(need.solids.unit)
      end
      need.solids.min <= given_solids
    end
  end
end
