module Nemah
  class Nutrients
    def self.default_input_unit_mappings
      {
        calcium: :g,
        energy: :MJ,
        magnesium: :g,
        phosphor: :g,
        protein: :g,
        salt: :g,
        selenium: :mg,
        solids: :percent_per_kg
      }
    end

    def self.names
      default_input_unit_mappings.keys
    end
  end
end
