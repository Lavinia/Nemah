module Nemah
  class FodderList
    def initialize(fodders = {})
      self.fodders = Hash.new(0).merge fodders
    end

    def count
      fodders.count
    end

    def amount_of(fodder)
      fodders[fodder]
    end

    def add(fodder, amount = 0)
      fodders[fodder] += amount
      self
    end

    def remove(fodder, amount = :not_specified)
      (amount == :not_specified) ? remove_fodder(fodder) : reduce_fodder(fodder, amount)
      self
    end

    def to_h
      fodders.dup
    end

    private

    attr_accessor :fodders

    def reduce_fodder(fodder, amount)
      fodders[fodder] = [fodders[fodder] - amount, 0].max
    end

    def remove_fodder(fodder)
      fodders.delete_if { |key, _| key == fodder }
    end
  end
end
