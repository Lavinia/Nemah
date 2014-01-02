module Nemah
  class Workload
    ATTRIBUTES = [:walk, :trot_and_canter, :days_per_week].freeze

    attr_reader *ATTRIBUTES

    def initialize(args = {})
      attributes.each do |attribute|
        instance_variable_set "@#{attribute}", args.fetch(attribute, 0)
      end
      assert_valid_days_per_week
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

    def assert_valid_days_per_week
      raise ArgumentError.new('days_per_week must be between 0 and 7') unless (0..7).include? days_per_week
    end
  end
end
