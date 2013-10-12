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
      assert_valid(:feedability)
      assert_valid(:gender)
    end

    private

    def assert_valid(attribute)
      unless allowed_values_for(attribute).include? send(attribute)
        raise ArgumentError, "\"#{send(attribute).inspect}\" is not an allowed #{attribute}"
      end
    end

    def allowed_values_for(attribute)
      case attribute
      when :gender then allowed_genders
      when :feedability then allowed_feedabilities
      else
        Everything.new
      end
    end

    def allowed_feedabilities
      [:easy, :normal, :hard]
    end

    def allowed_genders
      [:gelding, :mare, :stallion]
    end
  end

  class Everything
    def include?(_)
      true
    end
  end
end
