module Nemah
  class Need
    attr_reader :horse

    def initialize(horse)
      @horse = horse
    end

    def solids
      (horse_weight_in_deciton * 1.5)..Float::INFINITY
    end

    def selenium
      (horse_weight_in_deciton * 0.2)..(horse_weight_in_deciton * 5.0)
    end

    private

    def horse_weight_in_deciton
      horse.weight / 100.00
    end
  end
end
