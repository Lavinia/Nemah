module Nemah
  module SpecificNeed
    module MineralBehaviour
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
        EnergyWorkloadRatio.new(energy.for_workload, energy.for_maintenance, factor_table).factor
      end

      def energy
        need.energy
      end

      def factor_table
        raise NotImplementedError, 'factor_table must return an instance of FactorTable'
      end

      class FactorTable
        attr_reader :no_work, :below_30, :below_50, :below_75, :above_75

        def initialize(factors)
          @no_work = factors.fetch(:no_work)
          @below_30 = factors.fetch(:below_30)
          @below_50 = factors.fetch(:below_50)
          @below_75 = factors.fetch(:below_75)
          @above_75 = factors.fetch(:above_75)
        end
      end

      class EnergyWorkloadRatio
        def initialize(workload_energy, maintenance_energy, factor_table)
          @workload_energy = workload_energy
          @maintenance_energy = maintenance_energy
          @factor_table = factor_table
        end

        def factor
          if workload_energy_quota == 0
            factor_table.no_work
          elsif workload_energy_quota < 0.30
            factor_table.below_30
          elsif workload_energy_quota < 0.50
            factor_table.below_50
          elsif workload_energy_quota < 0.75
            factor_table.below_75
          else
            factor_table.above_75
          end
        end

        private

        attr_reader :workload_energy, :maintenance_energy, :factor_table

        def workload_energy_quota
          workload_energy.to_f / maintenance_energy.to_f
        end
      end
    end
  end
end
