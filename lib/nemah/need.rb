module Nemah
  class Need
    attr_reader :horse

    def initialize(horse)
      @horse = horse
    end

    def solids
      rounded_range(horse.weight_in_deciton * 1.50, Float::INFINITY)
    end

    def selenium
      rounded_range(horse.weight_in_deciton * 0.20, horse.weight_in_deciton * 5.00)
    end

    def energy
      Energy.new(self).to_rounded_range
    end

    def protein
      Protein.new(self).to_rounded_range
    end

    def ideal_energy
      Energy.new(self).ideal
    end

    private

    def rounded_range(low, high)
      low.round(2)..high.round(2)
    end
  end

  class Protein
    attr_reader :need

    def initialize(need)
      @need = need
    end

    def to_rounded_range
      min_protein.round(2)..max_protein.round(2)
    end

    private

    def ideal_protein
      ideal_energy * 6
    end

    def min_protein
      0.90 * ideal_protein
    end

    def max_protein
      1.10 * ideal_protein
    end

    def ideal_energy
      need.ideal_energy
    end
  end

  class Energy
    attr_reader :need

    def initialize(need)
      @need = need
    end

    def ideal
      0.50 * (horse.weight ** 0.75 ) * feedability_factor * gender_factor + workload_energy
    end

    def to_rounded_range
      min.round(2)..max.round(2)
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
