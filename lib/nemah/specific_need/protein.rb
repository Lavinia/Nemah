module Nemah
  module SpecificNeed
    class Protein < AbstractNeed
      def ideal
        ideal_energy * 6
      end

      private

      def min
        0.90 * ideal
      end

      def max
        1.10 * ideal
      end

      def ideal_energy
        need.energy.ideal
      end
    end
  end
end
