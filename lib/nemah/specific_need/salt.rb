module Nemah
  module SpecificNeed
    class Salt < AbstractNeed
      include Nemah::SpecificNeed::MineralBehaviour

      private

      def factor_table
        FactorTable.new(no_work: 5.1, below_30: 7.0, below_50: 9.0, below_75: 9.0, above_75: 13.0)
      end
    end
  end
end
