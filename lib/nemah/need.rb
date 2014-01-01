module Nemah
  class Need
    attr_reader :horse

    def initialize(horse)
      @horse = horse
    end

    def calcium
      Nemah::SpecificNeed::Calcium.new(self)
    end

    def energy
      Nemah::SpecificNeed::Energy.new(self)
    end

    def magnesium
      Nemah::SpecificNeed::Magnesium.new(self)
    end

    def phosphor
      Nemah::SpecificNeed::Phosphor.new(self)
    end

    def protein
      Nemah::SpecificNeed::Protein.new(self)
    end

    def salt
      Nemah::SpecificNeed::Salt.new(self)
    end

    def selenium
      Nemah::SpecificNeed::Selenium.new(self)
    end

    def solids
      Nemah::SpecificNeed::Solids.new(self)
    end
  end
end
