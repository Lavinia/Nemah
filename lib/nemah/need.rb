module Nemah
  class Need
    attr_reader :horse

    def initialize(horse)
      @horse = horse
    end

    def solids
      Nemah::SpecificNeed::Solids.new(self)
    end

    def selenium
      Nemah::SpecificNeed::Selenium.new(self)
    end

    def energy
      Energy.new(self)
    end

    def protein
      Nemah::SpecificNeed::Protein.new(self)
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
end
