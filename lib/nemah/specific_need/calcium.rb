module Nemah
  module SpecificNeed
    class Calcium < AbstractNeed
      def max(decimals: 2)
        _max
      end

      private

      def _ideal
        _min
      end

      def _min
        horse.weight_in_deciton * energy_and_workload_factor
      end

      def _max
        Float::INFINITY
      end

      def energy_and_workload_factor
        if workload_energy_quota == 0
          4.0
        elsif workload_energy_quota < 0.30
          6.0
        elsif workload_energy_quota < 0.50
          7.0
        elsif workload_energy_quota < 0.75
          8.0
        else
          8.0
        end
      end

      def workload_energy_quota
        energy.for_workload.to_f / energy.for_maintenance.to_f
      end

      def energy
        need.energy
      end
    end
  end
end
