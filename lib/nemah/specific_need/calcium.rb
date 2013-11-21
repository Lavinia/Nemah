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
        elsif workload_energy_quota < 30
          6.0
        end
      end

      def workload_energy_quota
        maintenance_energy = need.energy.ideal - need.energy.workload
        need.energy.workload.to_f / maintenance_energy.to_f
      end
    end
  end
end
