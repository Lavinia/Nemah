module Nemah
  class Amount
    attr_reader :unit

    def initialize(value, unit)
      @value = value
      @unit = unit
    end

    def value(specified_unit = unit)
      if specified_unit == :kg && unit == :percent_per_kg
        @value / 100.0
      else
        @value
      end
    end
  end
end
