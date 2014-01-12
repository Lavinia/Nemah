module Nemah
  class Fodder
    attr_reader :name, :calcium, :energy, :protein, :selenium, :solids

    def initialize(name, nutrients = {})
      @name = name
      @calcium = Amount.new(nutrients.fetch(:calcium, 0.0), :g)
      @energy = Amount.new(nutrients.fetch(:energy, 0.0), :MJ)
      @protein = Amount.new(nutrients.fetch(:protein, 0.0), :g)
      @selenium = Amount.new(nutrients.fetch(:selenium, 0.0), :mg)
      @solids = Amount.new(nutrients.fetch(:solids, 0.0), :percent_per_kg)
    end

    private

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
end
