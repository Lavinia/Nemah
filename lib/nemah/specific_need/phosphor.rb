module Nemah
  module SpecificNeed
    class Phosphor < AbstractNeed
      include Nemah::SpecificNeed::MineralBehaviour

      def factor_table
        FactorTable.new(no_work: 2.8, below_30: 3.6, below_50: 4.2, below_75: 5.8, above_75: 5.8)
      end
    end
  end
end
