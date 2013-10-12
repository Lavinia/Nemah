require 'nemah/version'

module Nemah
  class Horse
    class AttributeRequiredError < ArgumentError
      def initialize(attribute)
        super("#{attribute} required")
      end
    end

    attr_reader :weight, :gender, :name, :feedability

    def initialize(attributes)
      @weight = attributes.fetch(:weight) { raise AttributeRequiredError, :weight }
      @gender = attributes.fetch(:gender) { raise AttributeRequiredError, :gender }
      @name = attributes.fetch(:name, '')
      @feedability = attributes.fetch(:feedability, :normal)
      assert_valid_feedability
    end

    private

    def assert_valid_feedability
      unless allowed_feedabilities.include? feedability
        raise ArgumentError, "\"#{feedability.inspect}\" is not an allowed feedability"
      end
    end

    def allowed_feedabilities
      [:easy, :normal, :hard]
    end
  end
end
