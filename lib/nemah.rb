require 'nemah/version'

module Nemah
  class Horse
    class AttributeRequiredError < ArgumentError
      def initialize(attribute)
        super("#{attribute} required")
      end
    end

    attr_reader :weight, :gender, :name

    def initialize(attributes)
      @weight = attributes.fetch(:weight) { raise AttributeRequiredError, :weight }
      @gender = attributes.fetch(:gender) { raise AttributeRequiredError, :gender }
      @name = attributes.fetch(:name, '')
    end
  end
end
