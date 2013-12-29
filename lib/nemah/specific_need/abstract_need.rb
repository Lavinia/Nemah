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

      def min(decimals: 2)
        _min.round(decimals)
      end

      def max(decimals: 2)
        _max.round(decimals)
      end

      def to_rounded_range(decimals: 2)
        min(decimals: decimals)..max(decimals: decimals)
      end

      def unit
        :g
      end

      private

      def _ideal
        raise NotImplementedError, '#_ideal() must return an object responding to #round(n)'
      end

      def _min
        raise NotImplementedError, '#min() must return an object responding to #round(n)'
      end

      def _max
        raise NotImplementedError, '#max() must return an object responding to #round(n)'
      end

      def horse
        need.horse
      end
    end
  end
end
