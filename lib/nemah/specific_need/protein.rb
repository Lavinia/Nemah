module Nemah
  module SpecificNeed
    class Protein < AbstractNeed
      private

      def _ideal
        ideal_energy * 6
      end

      def min
        0.90 * _ideal
      end

      def max
        1.10 * _ideal
      end

      def ideal_energy
        need.energy.ideal(decimals: 4)
      end
    end
  end
end
