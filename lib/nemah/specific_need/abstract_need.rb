module Nemah
  module SpecificNeed
    class AbstractNeed
      attr_reader :need

      def initialize(need)
        @need = need
      end

      def ideal(decimals: 2)
        _ideal.round(decimals)
      end

      def to_rounded_range
        min.round(2)..max.round(2)
      end

      private

      def _ideal
        raise NotImplementedError, '#_ideal() must return an object responding to #round(n)'
      end

      def horse
        need.horse
      end

      def min
        raise NotImplementedError, '#min() must return an object responding to #round(n)'
      end

      def max
        raise NotImplementedError, '#max() must return an object responding to #round(n)'
      end
    end
  end
end
