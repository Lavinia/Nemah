module Nemah
  module SpecificNeed
    class AbstractNeed
      attr_reader :need

      def initialize(need)
        @need = need
      end

      def to_rounded_range
        min.round(2)..max.round(2)
      end

      private

      def horse
        need.horse
      end

      def min
        raise NotImplementedError, 'min() must return an object responding to #round'
      end

      def max
        raise NotImplementedError, 'max() must return an object responding to #round'
      end
    end
  end
end
