module Nemah
  class Need
    attr_reader :horse

    def initialize(horse)
      @horse = horse
    end

    def solids
      rounded_range(horse_weight_in_deciton * 1.50, Float::INFINITY)
    end

    def selenium
      rounded_range(horse_weight_in_deciton * 0.20, horse_weight_in_deciton * 5.00)
    end

    def energy
      rounded_range(min_energy, max_energy)
    end

    def protein
      rounded_range(min_protein, max_protein)
    end

    private

    def rounded_range(low, high)
      low.round(2)..high.round(2)
    end

    def ideal_protein
      ideal_energy * 6
    end

    def min_protein
      0.90 * ideal_protein
    end

    def max_protein
      1.10 * ideal_protein
    end

    def min_energy
      ideal_energy - 3
    end

    def max_energy
      ideal_energy + 3
    end

    def ideal_energy
      0.50 * (horse.weight ** 0.75 ) * feedability_factor * gender_factor + workload_energy
    end

    def workload_energy
      energy_addition_for_walk + energy_addition_for_trot_and_canter
    end

    def energy_addition_for_walk
      (0.20 * horse_weight_in_deciton * horse.workload.walk / 10.0) * days_per_week_factor
    end

    def energy_addition_for_trot_and_canter
      (1.30 * horse_weight_in_deciton * horse.workload.trot_and_canter / 10.0) * days_per_week_factor
    end

    def days_per_week_factor
      horse.workload.days_per_week / 7.0
    end

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

    def horse_weight_in_deciton
      horse.weight / 100.00
    end
  end
end
