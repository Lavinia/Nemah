module Nemah
  class Fodder
    attr_reader :name, :calcium, :energy, :magnesium, :phosphor, :protein, :salt, :selenium, :solids

    def initialize(name, nutrients = {})
      @name = name
      @calcium = Nemah::Amount.new(nutrients.fetch(:calcium, 0.0), :g)
      @energy = Nemah::Amount.new(nutrients.fetch(:energy, 0.0), :MJ)
      @magnesium = Nemah::Amount.new(nutrients.fetch(:magnesium, 0.0), :g)
      @phosphor = Nemah::Amount.new(nutrients.fetch(:phosphor, 0.0), :g)
      @protein = Nemah::Amount.new(nutrients.fetch(:protein, 0.0), :g)
      @salt = Nemah::Amount.new(nutrients.fetch(:salt, 0.0), :g)
      @selenium = Nemah::Amount.new(nutrients.fetch(:selenium, 0.0), :mg)
      @solids = Nemah::Amount.new(nutrients.fetch(:solids, 0.0), :percent_per_kg)
    end
  end
end
