module Nemah
  class Need
    attr_reader :horse

    def initialize(horse)
      @horse = horse
    end

    def solids
      Nemah::SpecificNeed::Solids.new(self)
    end

    def selenium
      Nemah::SpecificNeed::Selenium.new(self)
    end

    def energy
      Nemah::SpecificNeed::Energy.new(self)
    end

    def protein
      Nemah::SpecificNeed::Protein.new(self)
    end
  end
end
