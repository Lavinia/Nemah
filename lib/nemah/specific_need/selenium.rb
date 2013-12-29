module Nemah
  module SpecificNeed
    class Selenium < AbstractNeed
      def unit
        :mg
      end

      private

      def _ideal
        min
      end

      def _min
        horse.weight_in_deciton * 0.20
      end

      def _max
        horse.weight_in_deciton * 5.00
      end
    end
  end
end
