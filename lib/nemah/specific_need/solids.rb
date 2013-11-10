module Nemah
  module SpecificNeed
    class Solids < AbstractNeed
      def ideal
        min
      end

      private

      def min
        horse.weight_in_deciton * 1.50
      end

      def max
        Float::INFINITY
      end
    end
  end
end
