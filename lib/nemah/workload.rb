module Nemah
  class Workload
    ATTRIBUTES = [:walk, :trot_and_canter, :days_per_week].freeze

    attr_reader *ATTRIBUTES

    def initialize(args = {})
      attributes.each do |attribute|
        instance_variable_set "@#{attribute}", args.fetch(attribute, 0)
      end
    end

    def ==(other)
      attributes.all? do |attribute|
        send(attribute) == other.send(attribute)
      end
    end

    private

    def attributes
      ATTRIBUTES.dup
    end
  end
end
