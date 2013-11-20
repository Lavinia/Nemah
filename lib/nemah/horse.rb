module Nemah
  class Horse
    class AttributeRequiredError < ArgumentError
      def initialize(attribute)
        super("#{attribute} required")
      end
    end

    attr_reader :weight, :gender, :name, :feedability, :workload

    def initialize(attributes)
      @weight = attributes.fetch(:weight) { raise AttributeRequiredError, :weight }
      @gender = attributes.fetch(:gender) { raise AttributeRequiredError, :gender }
      @name = attributes.fetch(:name, '')
      @feedability = attributes.fetch(:feedability, :normal)
      @workload = attributes.fetch(:workload, Workload.new)
      assert_validity_of(:feedability, :gender, :weight)
    end

    def stallion?
      gender == :stallion
    end

    def weight_in_deciton
      weight / 100.00
    end

    private

    def assert_validity_of(*attributes)
      attributes.each { |attribute| assert_valid(attribute) }
    end

    def assert_valid(attribute)
      unless allowed_values_for(attribute).include? send(attribute)
        raise ArgumentError, "#{send(attribute).inspect} is not an allowed #{attribute}"
      end
    end

    def allowed_values_for(attribute)
      case attribute
      when :gender then allowed_genders
      when :feedability then allowed_feedabilities
      when :weight then PositiveWeight.new
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

    class PositiveWeight
      def include?(weight)
        weight >= 0
      end
    end

    class Everything
      def include?(_)
        true
      end
    end
  end
end
