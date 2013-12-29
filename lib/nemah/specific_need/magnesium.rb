module Nemah
  module SpecificNeed
    class Magnesium < AbstractNeed
      include Nemah::SpecificNeed::MineralBehaviour

      private

      def factor_table
        FactorTable.new(no_work: 1.5, below_30: 1.9, below_50: 2.3, below_75: 3.0, above_75: 3.0)
      end
    end
  end
end
