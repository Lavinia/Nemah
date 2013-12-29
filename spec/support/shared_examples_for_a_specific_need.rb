shared_examples_for 'a specific need' do
  subject(:need) { described_class.new(double('need for a horse')) }

  describe 'the common interface' do
    it { should respond_to(:to_rounded_range) }
    it { should respond_to(:ideal) }
    it { should respond_to(:min) }
    it { should respond_to(:max) }
  end

  specify { expect(need.unit).to eq unit }
end
