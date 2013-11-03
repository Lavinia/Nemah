module Nemah
  module SpecificNeed
    class Solids < AbstractNeed
      private

      def min
        horse.weight_in_deciton * 1.50
      end

      def max
        Float::INFINITY
       end

      def horse
        need.horse
      end
    end
  end
end
