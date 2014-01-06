module Nemah
  class FodderList
    def initialize(fodders = {})
      self.fodders = fodders
    end

    def count
      fodders.count
    end

    def amount_of(fodder)
      fodders.fetch(fodder, 0)
    end

    def add(fodder, amount)
      fodders[fodder] = amount
      self
    end

    def remove(fodder)
      fodders.delete_if { |key, _| key == fodder }
      self
    end

    private

    attr_accessor :fodders
  end
end
