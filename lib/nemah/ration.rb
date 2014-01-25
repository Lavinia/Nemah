module Nemah
  class Ration
    attr_reader :fodder_list, :need

    def initialize(need, fodder_list)
      @fodder_list = fodder_list
      @need = need
    end

    def enough_energy?
      given_energy = fodder_list.each.inject(0) do |total_energy, (fodder, amount)|
        total_energy += amount * fodder.energy.value
      end
      need.energy.min <= given_energy
    end
  end
end
