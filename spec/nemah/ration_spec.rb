require 'spec_helper'

shared_examples_for 'a nutrient requirement' do
  it "returns true when the horse's nutrient need is met" do
    expect(ration.public_send("enough_#{nutrient}?")).to be_true
  end

  it 'returns false when the nutrient need is not met' do
    expect(ration(0.1).public_send("enough_#{nutrient}?")).to be_false
  end

  def ration(modifier = 0)
    nutrient_need = double(nutrient.to_s, min: nutrient_min + modifier, unit: nutrient_unit)
    need = double('need', nutrient => nutrient_need)
    fodder_list = Nemah::FodderList.new(fodders)
    ration = Nemah::Ration.new(need, fodder_list)
  end
end

describe Nemah::Ration do
  describe '#enough_calcium?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :calcium }
      let(:nutrient_min) { 35.6 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 3.56 }) => 10 } }
    end
  end

  describe '#enough_energy?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :energy }
      let(:nutrient_min) { 65 }
      let(:nutrient_unit) { :MJ }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 6.5 }) => 10 } }
    end
  end

  describe '#enough_magnesium?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :magnesium }
      let(:nutrient_min) { 25 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 2.5 }) => 10 } }
    end
  end

  describe '#enough_phosphor?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :phosphor }
      let(:nutrient_min) { 24.4 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 2.44 }) => 10 } }
    end
  end

  describe '#enough_protein?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :protein }
      let(:nutrient_min) { 330 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 33 }) => 10 } }
    end
  end

  describe '#enough_salt?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :salt }
      let(:nutrient_min) { 7.8 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 0.78 }) => 10 } }
    end
  end

  describe '#enough_selenium?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :selenium }
      let(:nutrient_min) { 12.1 }
      let(:nutrient_unit) { :mg }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 1.21 }) => 10 } }
    end
  end

  describe '#enough_solids?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :solids }
      let(:nutrient_min) { 7 }
      let(:nutrient_unit) { :kg }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 70 }) => 10 } }
    end
  end

  shared_examples_for 'a balance' do
    let(:need) do
      double('fake_need',
        first_nutrient.name => double(first_nutrient.name.to_s, unit: first_nutrient.unit),
        second_nutrient.name => double(second_nutrient.name.to_s, unit: second_nutrient.unit))
    end

    it 'returns true when the ratio is the lowest allowed' do
      expect(ration(allowed.first).public_send("#{balance}_in_balance?")).to be_true
    end

    it 'returns true when the ratio is the highest allowed' do
      expect(ration(allowed.last).public_send("#{balance}_in_balance?")).to be_true
    end

    it 'returns false when the ratio is below the allowed range' do
      expect(ration(allowed.first - 0.01).public_send("#{balance}_in_balance?")).to be_false
    end

    it 'returns false when the ratio is above the allowed range' do
      expect(ration(allowed.last + 0.01).public_send("#{balance}_in_balance?")).to be_false
    end

    private

    def ration(value)
      fodder_list = Nemah::FodderList.new({ Nemah::Fodder.new('hay', { first_nutrient.name => value, second_nutrient.name => 1 }) => 5 })
      Nemah::Ration.new(need, fodder_list)
    end
  end

  describe '#calcium_phosphor_in_balance?' do
    it_behaves_like 'a balance' do
      let(:balance) { :calcium_phosphor }
      let(:first_nutrient) { double(name: :calcium, unit: :g) }
      let(:second_nutrient) { double(name: :phosphor, unit: :g) }
      let(:allowed) { 1.2..1.8 }
    end
  end

  describe '#calcium_magnesium_in_balance?' do
    it_behaves_like 'a balance' do
      let(:balance) { :calcium_magnesium }
      let(:first_nutrient) { double(name: :calcium, unit: :g) }
      let(:second_nutrient) { double(name: :magnesium, unit: :g) }
      let(:allowed) { 2.0..3.0 }
    end
  end

  describe '#protein_energy_in_balance?' do
    it 'returns true when at least 6g protein per MJ energy' do
      expect(ration(protein: 6.0).protein_energy_in_balance?).to be_true
    end

    it 'returns false when less than 6g protein per MJ energy' do
      expect(ration(protein: 5.9).protein_energy_in_balance?).to be_false
    end

    def ration(protein: :not_specified)
      need = double('fake_need', energy: double('energy', unit: :MJ), protein: double('protein', unit: :g))
      fodder_list = Nemah::FodderList.new({ Nemah::Fodder.new('hay', { :energy => 1, :protein => protein }) => 5 })
      ration = Nemah::Ration.new(need, fodder_list)
    end
  end

  describe '#calcium_magnesium_balance' do
    it 'returns the balance' do
      need = double('fake_need', calcium: double('calcium', unit: :mg), magnesium: double('magnesium', unit: :mg))
      fodder_list = Nemah::FodderList.new({ Nemah::Fodder.new('hay', { :calcium => 2.6, :magnesium => 2.0 }) => 5 })
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.calcium_magnesium_balance).to eq 1.3
    end
  end

  describe '#calcium_phosphor_balance' do
    it 'returns the balance' do
      need = double('fake_need', calcium: double('calcium', unit: :mg), phosphor: double('phosphor', unit: :mg))
      fodder_list = Nemah::FodderList.new({ Nemah::Fodder.new('hay', { :calcium => 2.6, :phosphor => 2.0 }) => 5 })
      ration = Nemah::Ration.new(need, fodder_list)

      expect(ration.calcium_phosphor_balance).to eq 1.3
    end
  end
end
