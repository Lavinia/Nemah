module Nemah
  class Fodder
    KNOWN_NUTRIENTS = {
      calcium: :g,
      energy: :MJ,
      magnesium: :g,
      phosphor: :g,
      protein: :g,
      salt: :g,
      selenium: :mg,
      solids: :percent_per_kg
    }

    attr_reader :name, *KNOWN_NUTRIENTS.keys

    def initialize(name, nutrients = {})
      @name = name
      set_nutrients nutrients
    end

    private

    def set_nutrients(nutrients)
      KNOWN_NUTRIENTS.each do |nutrient, unit|
        instance_variable_set "@#{nutrient}", Nemah::Amount.new(nutrients.fetch(nutrient, 0.0), unit)
      end
    end
  end
end
