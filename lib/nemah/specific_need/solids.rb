module Nemah
  module SpecificNeed
    class Solids < AbstractNeed
      def max(decimals: 2)
        _max
      end

      private

      def _ideal
        min
      end

      def _min
        horse.weight_in_deciton * 1.50
      end

      def _max
        Float::INFINITY
      end
    end
  end
end
