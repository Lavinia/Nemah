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
    end
  end
end
