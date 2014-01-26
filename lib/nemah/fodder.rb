module Nemah
  class Fodder
    attr_reader :name, *Nemah::Nutrients.names

    def initialize(name, nutrients = {})
      @name = name
      set_nutrients nutrients
    end

    private

    def set_nutrients(nutrients)
      Nemah::Nutrients.default_input_unit_mappings.each do |nutrient, unit|
        instance_variable_set "@#{nutrient}", Nemah::Amount.new(nutrients.fetch(nutrient, 0.0), unit)
      end
    end
  end
end
