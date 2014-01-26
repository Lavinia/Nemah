module Nemah
  class Ration
    attr_reader :fodder_list, :need

    def initialize(need, fodder_list)
      @fodder_list = fodder_list
      @need = need
    end

    def enough_energy?
      enough?(:energy)
    end

    def enough_protein?
      enough?(:protein)
    end

    def enough_solids?
      enough?(:solids)
    end

    private

    def enough?(nutrient)
      given_nutrient = fodder_list.each.inject(0) do |total, (fodder, amount)|
        total += amount * fodder.public_send(nutrient).value(need.public_send(nutrient).unit)
      end
      need.public_send(nutrient).min <= given_nutrient
    end
  end
end
