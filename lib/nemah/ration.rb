module Nemah
  class Ration
    attr_reader :fodder_list, :need

    def initialize(need, fodder_list)
      @need = need
      @fodder_list = fodder_list
    end

    def balance(first_nutrient, second_nutrient)
      total(first_nutrient) / total(second_nutrient)
    end

    def calcium_magnesium_in_balance?
      (2.0..3.0).include? balance(:calcium, :magnesium)
    end

    def calcium_phosphor_in_balance?
      (1.2..1.8).include? balance(:calcium, :phosphor)
    end

    def protein_energy_in_balance?
      balance(:protein, :energy) >= 6.0
    end

    Nemah::Nutrients.names.each do |nutrient|
      define_method("enough_#{nutrient}?") { enough?(nutrient) }
      define_method("total_#{nutrient}") { total(nutrient) }
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
