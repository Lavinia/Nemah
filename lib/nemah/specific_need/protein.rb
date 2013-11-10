module Nemah
  module SpecificNeed
    class Protein < AbstractNeed
      def ideal(decimals: 2)
        _ideal.round(decimals)
      end

      private

      def _ideal
        ideal_energy * 6
      end

      def min
        0.90 * ideal
      end

      def max
        1.10 * ideal
      end

      def ideal_energy
        need.energy.ideal(decimals: 3)
      end
    end
  end
end
