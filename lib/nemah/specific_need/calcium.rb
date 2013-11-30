module Nemah
  module SpecificNeed
    class Calcium < AbstractNeed
      include Nemah::SpecificNeed::MineralBehaviour

      def factor_table
        FactorTable.new(no_work: 4.0, below_30: 6.0, below_50: 7.0, below_75: 8.0, above_75: 8.0)
      end
    end
  end
end
