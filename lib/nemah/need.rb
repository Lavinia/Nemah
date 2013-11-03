module Nemah
  class Need
    attr_reader :horse

    def initialize(horse)
      @horse = horse
    end

    def solids
      Solids.new(self)
    end

    def selenium
      Selenium.new(self)
    end

    def energy
      Energy.new(self)
    end

    def protein
      Protein.new(self)
    end
  end

  class SpecificNeed
    attr_reader :need

    def initialize(need)
      @need = need
    end

    def to_rounded_range
      min.round(2)..max.round(2)
    end
  end

  class Selenium < SpecificNeed
    private

    def min
      horse.weight_in_deciton * 0.20
    end

    def max
      horse.weight_in_deciton * 5.00
    end

    def horse
      need.horse
    end
  end

  class Solids < SpecificNeed
    private

    def min
      horse.weight_in_deciton * 1.50
    end

    def max
      Float::INFINITY
    end

    def horse
      need.horse
    end
  end

  class Protein < SpecificNeed
    private

    def ideal
      ideal_energy * 6
    end

    def min
      0.90 * ideal
    end

    def max
      1.10 * ideal
    end

    def ideal_energy
      need.energy.ideal
    end
  end

  class Energy < SpecificNeed
    def ideal
      0.50 * (horse.weight ** 0.75 ) * feedability_factor * gender_factor + workload_energy
    end

    private

    def feedability_factor
      case horse.feedability
      when :easy then 1.00
      when :normal then 1.05
      when :hard then 1.10
      end
    end

    def gender_factor
      (horse.stallion?) ? 1.10 : 1.00
    end

    def workload_energy
      energy_addition_for_walk + energy_addition_for_trot_and_canter
    end

    def energy_addition_for_walk
      (0.20 * horse.weight_in_deciton * horse.workload.walk / 10.0) * days_per_week_factor
    end

    def energy_addition_for_trot_and_canter
      (1.30 * horse.weight_in_deciton * horse.workload.trot_and_canter / 10.0) * days_per_week_factor
    end

    def days_per_week_factor
      horse.workload.days_per_week / 7.0
    end

    def min
      ideal - 3
    end

    def max
      ideal + 3
    end

    def horse
      need.horse
    end
  end
end
