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
        horse.weight_in_deciton * 4.0
      end

      def _max
        Float::INFINITY
      end

    end
  end
end
