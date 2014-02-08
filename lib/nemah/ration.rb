module Nemah
  class Ration
    attr_reader :fodder_list, :need

    def initialize(need, fodder_list)
      @need = need
      @fodder_list = fodder_list
    end

    Nemah::Nutrients.names.each do |nutrient|                     # def enough_nutrient?
      define_method("enough_#{nutrient}?") { enough?(nutrient) }  #   enough?(:nutrient)
    end                                                           # end

    def calcium_phosphor_in_balance?
      (1.2..1.8).include? calcium_phosphor_balance
    end

    def calcium_phosphor_balance
      total(:calcium) / total(:phosphor)
    end

    def calcium_magnesium_in_balance?
      (2.0..3.0).include? calcium_magnesium_balance
    end

    def calcium_magnesium_balance
      total(:calcium) / total(:magnesium)
    end

    def protein_energy_in_balance?
      protein_energy_balance >= 6.0
    end

    def protein_energy_balance
      total(:protein) / total(:energy)
    end

    private

    def enough?(nutrient)
      need.public_send(nutrient).min <= total(nutrient)
    end

    def total(nutrient)
      fodder_list.each.inject(0) do |total, (fodder, amount)|
        total += amount * fodder.public_send(nutrient).value(need.public_send(nutrient).unit)
      end
    end
  end
end
