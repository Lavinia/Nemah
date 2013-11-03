module Nemah
  module SpecificNeed
    class Selenium < AbstractNeed
      private

      def min
        horse.weight_in_deciton * 0.20
      end

      def max
        horse.weight_in_deciton * 5.00
      end

      def horse
        need.horse
      end
    end
  end
end
