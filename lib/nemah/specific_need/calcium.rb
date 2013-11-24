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
        EnergyWorkloadRatio.new(energy.for_workload, energy.for_maintenance).factor
      end

      def energy
        need.energy
      end

      class EnergyWorkloadRatio
        def initialize(workload_energy, maintenance_energy)
          @workload_energy = workload_energy
          @maintenance_energy = maintenance_energy
        end

        def factor
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

        private

        attr_reader :workload_energy, :maintenance_energy

        def workload_energy_quota
          workload_energy.to_f / maintenance_energy.to_f
        end
      end
    end
  end
end
